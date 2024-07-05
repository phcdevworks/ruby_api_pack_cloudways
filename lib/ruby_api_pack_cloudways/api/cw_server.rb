# frozen_string_literal: true

require_relative '../constants'

module RubyApiPackCloudways
  module Api
    class CwServer
      include RubyApiPackCloudways::Constants

      def self.cw_server_list
        servers = Connection::CwConnect.new(CW_API_URL, '/server').cloudways_api_connection
        servers['servers']
      end
    end
  end
end
