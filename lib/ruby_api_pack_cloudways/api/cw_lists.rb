# frozen_string_literal: true

require_relative '../constants'

module RubyApiPackCloudways
  module Api
    class CwLists
      # PHCDEVONE - Include the RubyApiPackCloudways::Constants module
      include RubyApiPackCloudways::Constants

      # PHCDEVONE - Fetch the list of providers from the Cloudways API
      def self.cw_provider_list
        fetch_list('/providers')['providers']
      end

      # PHCDEVONE - Fetch the list of server sizes from the Cloudways API
      def self.cw_server_size_list
        fetch_list('/server_sizes')['sizes']
      end

      # PHCDEVONE - Fetch the list of apps from the Cloudways API
      def self.cw_app_list
        fetch_list('/apps')['apps']
      end

      # PHCDEVONE - Fetch the list of packages from the Cloudways API
      def self.cw_package_list
        fetch_list('/packages')['packages']
      end

      # PHCDEVONE - Fetch the list from the Cloudways API based on the given endpoint
      def self.fetch_list(endpoint)
        Connection::CwConnect.new(CW_API_URL, endpoint).cloudways_api_connection
      end
    end
  end
end
