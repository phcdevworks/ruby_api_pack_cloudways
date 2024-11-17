# frozen_string_literal: true

require 'httparty'
require 'oj'
require 'openssl'

module RubyApiPackCloudways
  module Connection
    class CwConnect
      # Initialize Cloudways API URL and path
      attr_reader :cw_api_url_base, :cw_api_path

      # Initialize Cloudways API URL and path
      def initialize(cw_api_url_base, cw_api_path)
        @cw_api_url_base = cw_api_url_base
        @cw_api_path = cw_api_path
      end

      # GET request to Cloudways API
      def cloudways_api_connection
        token = CwToken.new.cw_api_token
        response = HTTParty.get(
          "#{@cw_api_url_base}#{@cw_api_path}",
          headers: { 'Authorization' => "Bearer #{token}" },
          ssl_version: :TLSv1_2,
          debug_output: $stdout
        )
        handle_response(response)
      rescue RuntimeError => e
        raise unless e.message.include?('Rate limit exceeded')

        sleep(60)
        retry
      end

      # POST request to Cloudways API
      def cloudways_api_post_connection(params)
        token = CwToken.new.cw_api_token
        response = HTTParty.post(
          "#{@cw_api_url_base}#{@cw_api_path}",
          headers: { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' },
          body: params.to_json,
          ssl_version: :TLSv1_2,
          debug_output: $stdout
        )
        handle_response(response)
      end

      private

      # Handle response from Cloudways API
      def handle_response(response)
        case response.code
        when 200
          parse_response(response)
        else
          raise "Error: Received status #{response.code}"
        end
      end

      # Parse response from Cloudways API
      def parse_response(response)
        content_type = response.headers&.fetch('content-type', nil)
        raise "Unexpected response: #{response.body}" unless content_type&.include?('application/json')

        Oj.load(response.body, mode: :strict)
      rescue Oj::ParseError => e
        raise "Error parsing response: #{e.message}. Raw body: #{response.body}"
      end
    end
  end
end
