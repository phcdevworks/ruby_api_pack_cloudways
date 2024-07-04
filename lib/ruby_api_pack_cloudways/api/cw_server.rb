# frozen_string_literal: true

module RubyApiPackCloudways
  module Api
    class CwServer
      # List - Servers
      def self.cw_server_list
        servers = Connection::CwConnect.new(CW_API_URL, '/server').cloudways_api_connection
        servers['servers']
      end
    end
  end
end
