module RubyApiPackCloudways
    module Api
        class CwLists

            def self.cw_server_list
                cw_api_list_server = Connection::CwConnect.new(CW_API_URL, "/server")
                return cw_api_list_server.cloudways_api_connection.body
            end

            def self.cw_providers_list
                providers_lists = Connection::CwConnect.new(CW_API_URL, "/providers")
                return Oj.load(providers_lists.cloudways_api_connection.body)["providers"]
            end

        end
    end         
end