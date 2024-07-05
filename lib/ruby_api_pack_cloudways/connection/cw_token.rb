# frozen_string_literal: true

require_relative '../constants'

module RubyApiPackCloudways
  module Connection
    class CwToken
      # PHCDEVONE - Define attribute readers for API URL base, auth path, user email, user key, and Faraday connection
      attr_reader :cw_api_url_base, :cw_url_path_auth, :cw_user_email, :cw_user_key, :faraday_connection

      # PHCDEVONE - Initialize the token connection with the given parameters and optional Faraday connection
      def initialize(cw_api_url_base, cw_url_path_auth, cw_user_email, cw_user_key, faraday_connection = Faraday)
        @cw_api_url_base = cw_api_url_base
        @cw_url_path_auth = cw_url_path_auth
        @cw_user_email = cw_user_email
        @cw_user_key = cw_user_key
        @faraday_connection = faraday_connection
      end

      # PHCDEVONE - Create a Faraday connection for the API token
      def cw_api_token_connection
        faraday_connection.new(url: "#{@cw_api_url_base}#{@cw_url_path_auth}") do |conn|
          conn.request :url_encoded
          conn.response :logger
          conn.adapter Faraday.default_adapter
        end
      end

      # PHCDEVONE - Retrieve the API token from the Cloudways API
      def cw_api_token
        response = cw_api_token_connection.post do |req|
          req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
          req.body = { email: @cw_user_email, api_key: @cw_user_key }
        end

        parse_response(response)['access_token']
      end

      private

      # PHCDEVONE - Parse the response from the API token request
      def parse_response(response)
        Oj.load(response.body)
      rescue Oj::ParseError => e
        raise "Error parsing response: #{e.message}"
      end
    end
  end
end
