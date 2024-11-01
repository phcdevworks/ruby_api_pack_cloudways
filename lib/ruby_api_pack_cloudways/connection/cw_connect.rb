# frozen_string_literal: true

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
          headers: { 'Authorization' => "Bearer #{token}" }
        )
        handle_response(response)
      end

      # POST request to Cloudways API
      def cloudways_api_post_connection(params)
        token = CwToken.new.cw_api_token
        response = HTTParty.post(
          "#{@cw_api_url_base}#{@cw_api_path}",
          headers: { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' },
          body: params.to_json
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
        Oj.load(response.body, mode: :strict)
      rescue Oj::ParseError => e
        raise "Error parsing response: #{e.message}"
      end
    end
  end
end
