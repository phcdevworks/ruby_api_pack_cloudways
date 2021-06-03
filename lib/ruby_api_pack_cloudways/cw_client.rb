module RubyApiPackCloudways
    class CwClient

        # Load Required Gems
        require "faraday"
        require "faraday_middleware"
        require "oj"

        # Auto Loads
        autoload :CwConnect, 'main/cw_connect'
        autoload :CwToken, 'main/cw_token'

        # Variables
        CW_API_URL = "https://api.cloudways.com/api/v1"
        CW_API_PATH_TOKEN = "/oauth/access_token"
        CW_API_PATH = "/server"
        CW_API_EMAIL = ENV["PHCDEV_API_CLOUDWAYS_EMAIL"]
        CW_API_KEY = ENV["PHCDEV_API_CLOUDWAYS_KEY"]

        # Load Main Files
        require_relative "cw_token"
        require_relative "cw_connect"

        # Get Token Response
        cw_api_get_token = CwToken.new(CW_API_URL, CW_API_PATH_TOKEN, CW_API_EMAIL, CW_API_KEY)
        cw_api_connection = CwConnect.new(CW_API_URL, CW_API_PATH, cw_api_get_token.cw_api_token)

    end
end