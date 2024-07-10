# frozen_string_literal: true

module RubyApiPackCloudways
  module Connection
    # PHCDEVONE - Define the CwConnect class within the RubyApiPackCloudways::Connection module
    class CwConnect
      # PHCDEVONE - Define attribute readers for the API URL base and API path
      attr_reader :cw_api_url_base, :cw_api_path

      # PHCDEVONE - Initialize the CwConnect with the base URL and API path
      def initialize(cw_api_url_base, cw_api_path)
        @cw_api_url_base = cw_api_url_base
        @cw_api_path = cw_api_path
      end

      # PHCDEVONE - Method to establish a connection to the Cloudways API
      def cloudways_api_connection
        # PHCDEVONE - Obtain the API token using the CwToken class
        token = CwToken.new.cw_api_token
        # PHCDEVONE - Make a GET request to the Cloudways API with the authorization header
        response = HTTParty.get(
          "#{@cw_api_url_base}#{@cw_api_path}",
          headers: { 'Authorization' => "Bearer #{token}" }
        )
        handle_response(response)
      end

      private

      # PHCDEVONE - Method to handle the API response
      def handle_response(response)
        case response.code
        when 200
          parse_response(response)
        else
          raise "Error: Received status #{response.code}"
        end
      end

      # PHCDEVONE - Method to parse the response body
      def parse_response(response)
        Oj.load(response.body)
      rescue Oj::ParseError => e
        raise "Error parsing response: #{e.message}"
      end
    end
  end
end
