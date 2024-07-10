# frozen_string_literal: true

module RubyApiPackCloudways
  module Connection
    # PHCDEVONE - Define the CwToken class within the RubyApiPackCloudways::Connection module
    class CwToken
      # PHCDEVONE - Define attribute readers for the API URL base, auth path, user email, and user key
      attr_reader :cw_api_url_base, :cw_url_path_auth, :cw_user_email, :cw_user_key

      # PHCDEVONE - Initialize the CwToken with configuration settings
      def initialize
        # PHCDEVONE - Set the base URL for the Cloudways API from the configuration
        @cw_api_url_base = RubyApiPackCloudways.configuration.api_url
        # PHCDEVONE - Set the authentication path for the Cloudways API from the configuration
        @cw_url_path_auth = RubyApiPackCloudways.configuration.api_path_token
        # PHCDEVONE - Set the user email for the Cloudways API from the configuration
        @cw_user_email = RubyApiPackCloudways.configuration.api_email
        # PHCDEVONE - Set the user key for the Cloudways API from the configuration
        @cw_user_key = RubyApiPackCloudways.configuration.api_key
      end

      # PHCDEVONE - Method to obtain the API token from the Cloudways API
      def cw_api_token
        response = HTTParty.post(
          "#{@cw_api_url_base}#{@cw_url_path_auth}",
          headers: { 'Content-Type' => 'application/x-www-form-urlencoded' },
          body: { email: @cw_user_email, api_key: @cw_user_key }
        )
        parse_response(response)['access_token']
      end

      private

      # PHCDEVONE - Method to parse the response from the API
      def parse_response(response)
        Oj.load(response.body)
      rescue Oj::ParseError => e
        raise "Error parsing response: #{e.message}"
      end
    end
  end
end
