# frozen_string_literal: true

module RubyApiPackCloudways
  module Connection
    class CwToken
      # Buffer time before token expiration to fetch a new token
      TOKEN_EXPIRATION_BUFFER = 300

      attr_reader :cw_api_url_base, :cw_url_path_auth, :cw_user_email, :cw_user_key

      def initialize
        @cw_api_url_base = RubyApiPackCloudways.configuration.api_url
        @cw_url_path_auth = RubyApiPackCloudways.configuration.api_path_token
        @cw_user_email = RubyApiPackCloudways.configuration.api_email
        @cw_user_key = RubyApiPackCloudways.configuration.api_key
        @cached_token = nil
        @token_expiry = nil
      end

      # Fetch the API token, using caching to avoid unnecessary requests
      def cw_api_token
        # Use cached token if valid and not near expiration
        return @cached_token if valid_cached_token?

        # Fetch a new token
        response = HTTParty.post(
          "#{@cw_api_url_base}#{@cw_url_path_auth}",
          headers: { 'Content-Type' => 'application/x-www-form-urlencoded' },
          body: { email: @cw_user_email, api_key: @cw_user_key },
          debug_output: $stdout # Enable debug output for troubleshooting
        )

        if response.code == 200
          # Parse the response and cache the token
          parsed_response = parse_response(response)
          @cached_token = parsed_response['access_token']
          @token_expiry = Time.now + parsed_response['expires_in']
          @cached_token
        else
          handle_error_response(response)
        end
      end

      private

      # Check if the cached token is still valid
      def valid_cached_token?
        @cached_token && @token_expiry && Time.now < (@token_expiry - TOKEN_EXPIRATION_BUFFER)
      end

      # Parse the API response
      def parse_response(response)
        Oj.load(response.body, mode: :strict)
      rescue Oj::ParseError => e
        raise "Error parsing response: #{e.message}. Raw body: #{response.body}"
      end

      # Handle non-200 responses
      def handle_error_response(response)
        error_message = "Failed to fetch token: #{response.code} - #{response.body}"
        puts error_message
        raise error_message
      end
    end
  end
end
