# frozen_string_literal: true

# /lib/ruby_api_pack_cloudways/connection/cw_token.rb

module RubyApiPackCloudways
  module Connection
    class CwToken
      attr_reader :cw_api_url_base, :cw_url_path_auth, :cw_user_email, :cw_user_key

      def initialize(cw_api_url_base, cw_url_path_auth, cw_user_email, cw_user_key)
        @cw_api_url_base = cw_api_url_base
        @cw_url_path_auth = cw_url_path_auth
        @cw_user_email = cw_user_email
        @cw_user_key = cw_user_key
      end

      def cw_api_token_connection
        Faraday.new(url: "#{@cw_api_url_base}#{@cw_url_path_auth}") do |conn|
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
