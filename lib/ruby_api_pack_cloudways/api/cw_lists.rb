module RubyApiPackCloudways
    module Api
        class CwLists

            # List - Providers
            def self.cw_provider_list
                providers_list = Connection::CwConnect.new(CW_API_URL, "/providers")
                return Oj.load(providers_list.cloudways_api_connection.body)["providers"]
            end

            # List - Server Sizes
            def self.cw_server_size_list
                server_sizes_list = Connection::CwConnect.new(CW_API_URL, "/server_sizes")
                return Oj.load(server_sizes_list.cloudways_api_connection.body)["sizes"]
            end

            # List - App
            def self.cw_app_list
                app_list = Connection::CwConnect.new(CW_API_URL, "/apps")
                return Oj.load(app_list.cloudways_api_connection.body)["apps"]
            end

            # List - Package
            def self.cw_package_list
                package_list = Connection::CwConnect.new(CW_API_URL, "/packages")
                return Oj.load(package_list.cloudways_api_connection.body)["packages"]
            end

        end
    end         
end