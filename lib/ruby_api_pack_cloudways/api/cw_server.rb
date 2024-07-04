# frozen_string_literal: true

# /lib/ruby_api_pack_cloudways/api/cw_server.rb

module RubyApiPackCloudways
  module Api
    class CwServer
      def self.cw_server_list
        servers = Connection::CwConnect.new(CW_API_URL, '/server').cloudways_api_connection
        servers['servers']
      end
    end
  end
end
