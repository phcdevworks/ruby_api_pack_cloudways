# frozen_string_literal: true

module RubyApiPackCloudways
  module Api
    # PHCDEVONE - Define the CwServer class within the RubyApiPackCloudways::Api module
    class CwServer
      # PHCDEVONE - Fetch the list of servers from the Cloudways API
      def self.cw_server_list
        fetch_list('/server')['servers']
      end

      # PHCDEVONE - Fetch the list from the Cloudways API based on the given endpoint
      def self.fetch_list(endpoint)
        Connection::CwConnect.new(RubyApiPackCloudways.configuration.api_url, endpoint).cloudways_api_connection
      end
    end
  end
end
