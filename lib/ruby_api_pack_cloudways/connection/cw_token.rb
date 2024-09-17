# frozen_string_literal: true

module RubyApiPackCloudways
  module Connection
    class CwToken
      attr_reader :cw_api_url_base, :cw_url_path_auth, :cw_user_email, :cw_user_key

      def initialize
        @cw_api_url_base = RubyApiPackCloudways.configuration.api_url
        @cw_url_path_auth = RubyApiPackCloudways.configuration.api_path_token
        @cw_user_email = RubyApiPackCloudways.configuration.api_email
        @cw_user_key = RubyApiPackCloudways.configuration.api_key
      end

      def cw_api_token
        response = HTTParty.post(
          "#{@cw_api_url_base}#{@cw_url_path_auth}",
          headers: { 'Content-Type' => 'application/x-www-form-urlencoded' },
          body: { email: @cw_user_email, api_key: @cw_user_key }
        )
        parse_response(response)['access_token']
      end

      private

      def parse_response(response)
        Oj.load(response.body)
      rescue Oj::ParseError => e
        raise "Error parsing response: #{e.message}"
      end
    end
  end
end
