module RubyApiPackCloudways
    module Api
        class CwLists
            
            def self.cw_server_list
                cw_api_token  = RubyApiPackCloudways::Connection::CwToken.new(CW_API_URL, CW_API_PATH_TOKEN, CW_API_EMAIL, CW_API_KEY)
                server_lists = RubyApiPackCloudways::Connection::CwConnect.new(CW_API_URL, "/servers", cw_api_token)
                return server_lists
            end

        end
    end         
end