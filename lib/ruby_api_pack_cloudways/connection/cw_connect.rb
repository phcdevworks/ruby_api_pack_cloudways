# frozen_string_literal: true

module RubyApiPackCloudways
  module Connection
    class CwConnect
      attr_reader :cw_api_url_base, :cw_api_path, :faraday_connection

      def initialize(cw_api_url_base, cw_api_path, faraday_connection = Faraday)
        @cw_api_url_base = cw_api_url_base
        @cw_api_path = cw_api_path
        @faraday_connection = faraday_connection
      end

      def cloudways_api_connection
        token = fetch_token
        response = create_connection(token).get(@cw_api_path)
        handle_response(response)
      end

      private

      def fetch_token
        CwToken.new(faraday_connection).cw_api_token
      end

      def create_connection(token)
        faraday_connection.new(url: @cw_api_url_base) do |conn|
          conn.request :oauth2, token, token_type: :bearer
          conn.response :logger
          conn.adapter Faraday.default_adapter
        end
      end

      def handle_response(response)
        case response.status
        when 200
          parse_response(response)
        else
          raise "Error: Received status #{response.status}"
        end
      end

      def parse_response(response)
        Oj.load(response.body)
      rescue Oj::ParseError => e
        raise "Error parsing response: #{e.message}"
      end
    end
  end
end
