# frozen_string_literal: true

require_relative '../constants'

module RubyApiPackCloudways
  module Connection
    class CwConnect
      # PHCDEVONE - Include the RubyApiPackCloudways::Constants module
      include RubyApiPackCloudways::Constants

      # PHCDEVONE - Define attribute readers for the base URL, path, and Faraday connection
      attr_reader :cw_api_url_base, :cw_api_path, :faraday_connection

      # PHCDEVONE - Initialize the connection with the given URL, path, and optional Faraday connection
      def initialize(cw_api_url_base, cw_api_path, faraday_connection = nil)
        @cw_api_url_base = cw_api_url_base
        @cw_api_path = cw_api_path
        @faraday_connection = faraday_connection || Faraday
      end

      # PHCDEVONE - Establish a connection to the Cloudways API and handle the response
      def cloudways_api_connection
        token = fetch_token
        response = create_connection(token).get(@cw_api_path)
        handle_response(response)
      end

      private

      # PHCDEVONE - Fetch the API token using the CwToken class
      def fetch_token
        CwToken.new(CW_API_URL, CW_API_PATH_TOKEN, CW_API_EMAIL, CW_API_KEY).cw_api_token
      end

      # PHCDEVONE - Create a Faraday connection with the given token
      def create_connection(token)
        faraday_connection.new(url: @cw_api_url_base) do |conn|
          conn.request :oauth2, token, token_type: :bearer
          conn.response :logger
          conn.adapter Faraday.default_adapter
        end
      end

      # PHCDEVONE - Handle the response from the API call
      def handle_response(response)
        case response.status
        when 200
          parse_response(response)
        else
          raise "Error: Received status #{response.status}"
        end
      end

      # PHCDEVONE - Parse the API response using Oj
      def parse_response(response)
        Oj.load(response.body)
      rescue Oj::ParseError => e
        raise "Error parsing response: #{e.message}"
      end
    end
  end
end
