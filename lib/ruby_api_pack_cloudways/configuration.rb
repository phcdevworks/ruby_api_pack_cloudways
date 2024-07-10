# frozen_string_literal: true

module RubyApiPackCloudways
  # PHCDEVONE - Define the Configuration class within the RubyApiPackCloudways module
  class Configuration
    # PHCDEVONE - Define attribute accessors for the configuration settings
    attr_accessor :api_url, :api_path_token, :api_email, :api_key

    # PHCDEVONE - Initialize the configuration with default values
    def initialize
      # PHCDEVONE - Set the default API URL for Cloudways
      @api_url = 'https://api.cloudways.com/api/v1'
      # PHCDEVONE - Set the default API path for token authentication
      @api_path_token = '/oauth/access_token'
      # PHCDEVONE - Initialize the API email as nil
      @api_email = nil
      # PHCDEVONE - Initialize the API key as nil
      @api_key = nil
    end
  end
end
