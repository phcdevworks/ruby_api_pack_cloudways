module RubyApiPackCloudways
  module Api
    class CwLists
      # List - Providers
      def self.cw_provider_list
        providers = Connection::CwConnect.new(CW_API_URL, '/providers').cloudways_api_connection
        providers['providers']
      end

      # List - Server Sizes
      def self.cw_server_size_list
        sizes = Connection::CwConnect.new(CW_API_URL, '/server_sizes').cloudways_api_connection
        sizes['sizes']
      end

      # List - App
      def self.cw_app_list
        apps = Connection::CwConnect.new(CW_API_URL, '/apps').cloudways_api_connection
        apps['apps']
      end

      # List - Package
      def self.cw_package_list
        packages = Connection::CwConnect.new(CW_API_URL, '/packages').cloudways_api_connection
        packages['packages']
      end
    end
  end
end
