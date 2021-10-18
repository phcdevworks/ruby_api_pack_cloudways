module RubyApiPackCloudways
    module Api
        class CwServer

            # List - Servers
            def self.cw_server_list
                cw_api_list_server = Connection::CwConnect.new(CW_API_URL, "/server")
                return Oj.load(cw_api_list_server.cloudways_api_connection.body)["servers"]
            end

        end
    end         
end