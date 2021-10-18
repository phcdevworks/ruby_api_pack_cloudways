module RubyApiPackCloudways
    module Connection
        class CwConnect

            # Connection - Attributes
            attr_accessor :cw_api_url_base, :cw_api_path

            # Connection - Init
            def initialize(cw_api_url_base, cw_api_path)
                @cw_api_url_base = cw_api_url_base
                @cw_api_path = cw_api_path
            end

            # Connection - API Connection Call
            def cloudways_api_connection

                cw_api_get_token_connection_request = Connection::CwToken.new(CW_API_URL, CW_API_PATH_TOKEN, CW_API_EMAIL, CW_API_KEY)
                cw_api_get_token_connection_response = cw_api_get_token_connection_request.cw_api_token
                
                cw_api_connetion_response = Faraday.new(url: @cw_api_url_base) do |cw_api_connection|
                    cw_api_connection.request :oauth2, cw_api_get_token_connection_response, token_type: :bearer
                    cw_api_connection.response :logger
                    cw_api_connection.adapter Faraday.default_adapter
                end

                return cw_api_connetion_response.get @cw_api_url_base + @cw_api_path

            end

        end
    end
end