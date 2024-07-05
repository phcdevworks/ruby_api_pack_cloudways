# frozen_string_literal: true

module RubyApiPackCloudways
  module Constants
    # PHCDEVONE - Define the base URL for the Cloudways API
    CW_API_URL = 'https://api.cloudways.com/api/v1'

    # PHCDEVONE - Define the authentication path for the Cloudways API
    CW_API_PATH_TOKEN = '/oauth/access_token'

    # PHCDEVONE - Retrieve the Cloudways API email from environment variables
    CW_API_EMAIL = ENV['PHCDEV_API_CLOUDWAYS_EMAIL']

    # PHCDEVONE - Retrieve the Cloudways API key from environment variables
    CW_API_KEY = ENV['PHCDEV_API_CLOUDWAYS_KEY']
  end
end
