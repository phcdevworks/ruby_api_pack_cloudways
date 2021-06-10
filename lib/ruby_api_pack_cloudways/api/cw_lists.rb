module RubyApiPackCloudways
    module Api
        class CwLists

            def self.cw_server_list
                cw_api_list_server = Connection::CwConnect.new(CW_API_URL, "/server", $cw_api_token.cw_api_token)
                return Oj.load(cw_api_list_server.cloudways_api_connection.body)["servers"]
            end

            def self.cw_providers_list
                providers_lists = Connection::CwConnect.new(CW_API_URL, "/providers", $cw_api_token.cw_api_token)
                return Oj.load(providers_lists.cloudways_api_connection.body)["providers"]
            end

        end
    end         
end