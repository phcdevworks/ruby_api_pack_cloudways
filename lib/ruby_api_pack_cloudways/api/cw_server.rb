# frozen_string_literal: true

module RubyApiPackCloudways
  module Api
    class CwServer
      # Fetch the list of servers from the Cloudways API
      def self.cw_server_list
        fetch_list('/server')['servers']
      end

      def self.fetch_list(endpoint)
        Connection::CwConnect.new(RubyApiPackCloudways.configuration.api_url, endpoint).cloudways_api_connection
      end
    end
  end
end
