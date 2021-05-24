module RubyApiPackCloudways
    module Main
        class CwToken

            # Cloudways - Token - Init
            def initialize(cw_api_url_base, cw_url_path_auth, cw_user_email, cw_user_key)  
                @cw_api_url_base = cw_api_url_base
                @cw_url_path_auth = cw_url_path_auth
                @cw_user_email = cw_user_email
                @cw_user_key = cw_user_key
                @cw_api_token = cw_api_token
            end 

            # Cloudways - Token - Connection
            def cw_api_token_connection
            
                # Cloudways - Token - Connection via Faraday
                Faraday.new url: @cw_api_url_base + @cw_url_path_auth do |cw_token_connection|
                    cw_token_connection.request  :url_encoded
                    cw_token_connection.response :logger
                    cw_token_connection.adapter  Faraday.default_adapter
                end
            
            end

            # Cloudways - Token - Request
            def cw_api_token

                # Cloudways - Token - Request From Above Connection Method
                cloudways_token_request = cw_api_token_connection.post do |cw_token_request|
                    cw_token_request.headers["Content-Type"] = "application/x-www-form-urlencoded"
                    cw_token_request.body = {
                        email: URI::encode(@cw_user_email),
                        api_key: URI::encode(@cw_user_key)
                    }
                end

                # Cloudways - Token - Request Isolate and Get Token from Response via OJ
                return @cw_apit_token = Oj.load(cloudways_token_request.body)["access_token"]

            end

        end
    end
end