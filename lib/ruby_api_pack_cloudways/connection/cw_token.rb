# frozen_string_literal: true

module RubyApiPackCloudways
  module Connection
    class CwToken
      attr_reader :cw_api_url_base, :cw_url_path_auth, :cw_user_email, :cw_user_key, :faraday_connection

      def initialize(faraday_connection = Faraday)
        @cw_api_url_base = RubyApiPackCloudways.configuration.api_url
        @cw_url_path_auth = RubyApiPackCloudways.configuration.api_path_token
        @cw_user_email = RubyApiPackCloudways.configuration.api_email
        @cw_user_key = RubyApiPackCloudways.configuration.api_key
        @faraday_connection = faraday_connection
      end

      def cw_api_token_connection
        faraday_connection.new(url: "#{@cw_api_url_base}#{@cw_url_path_auth}") do |conn|
          conn.request :url_encoded
          conn.response :logger
          conn.adapter Faraday.default_adapter
        end
      end

      def cw_api_token
        response = cw_api_token_connection.post do |req|
          req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
          req.body = { email: @cw_user_email, api_key: @cw_user_key }
        end

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
