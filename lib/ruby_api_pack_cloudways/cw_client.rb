# Variables
CW_API_URL = "https://api.cloudways.com/api/v1"
CW_API_PATH_TOKEN = "/oauth/access_token"
CW_API_EMAIL = ENV["PHCDEV_API_CLOUDWAYS_EMAIL"]
CW_API_KEY = ENV["PHCDEV_API_CLOUDWAYS_KEY"]

module RubyApiPackCloudways
    class CwClient

        # Load Required Gems
        require "faraday"
        require "oj"

        # Load Main Files
        require_relative "connection/cw_token"
        require_relative "connection/cw_connect"

        # Load API Files
        require_relative "api/cw_lists"
        require_relative "api/cw_server"

    end
end