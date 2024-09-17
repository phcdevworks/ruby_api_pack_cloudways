# frozen_string_literal: true

module RubyApiPackCloudways
  module Connection
    class CwConnect
      attr_reader :cw_api_url_base, :cw_api_path

      def initialize(cw_api_url_base, cw_api_path)
        @cw_api_url_base = cw_api_url_base
        @cw_api_path = cw_api_path
      end

      def cloudways_api_connection
        token = CwToken.new.cw_api_token
        response = HTTParty.get(
          "#{@cw_api_url_base}#{@cw_api_path}",
          headers: { 'Authorization' => "Bearer #{token}" }
        )
        handle_response(response)
      end

      private

      def handle_response(response)
        case response.code
        when 200
          parse_response(response)
        else
          raise "Error: Received status #{response.code}"
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
