# frozen_string_literal: true

module RubyApiPackCloudways
  module Api
    class CwServer
      # Fetch the list of servers from the Cloudways API
      def self.cw_server_list
        servers = Connection::CwConnect.new(RubyApiPackCloudways.configuration.api_url,
                                            '/server').cloudways_api_connection
        servers['servers']
      end
    end
  end
end
