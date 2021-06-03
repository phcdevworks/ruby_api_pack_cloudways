module RubyApiPackCloudways
    class CwConnect

        # Connection - Attributes
        attr_accessor :cw_api_url_base, :cw_api_path

        # Connection - Init
        def initialize(cw_api_url_base, cw_api_path, cw_api_token)  
            @cw_api_url_base = cw_api_url_base
            @cw_api_path = cw_api_path
            @cw_api_token = cw_api_token
        end

        # Connection - API Connection Call
        def self.cloudways_api_connection

            cw_api_connetion_response = Faraday.new(url: @cw_api_url_base) do |cw_api_connection|
                cw_api_connection.request :oauth2, @cw_api_token, token_type: :bearer
                cw_api_connection.response :logger
                cw_api_connection.adapter Faraday.default_adapter
            end

            return cw_api_connetion_response.get @cw_api_url_base + @cw_api_path

        end

    end
end