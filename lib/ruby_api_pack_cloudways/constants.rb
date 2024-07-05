# frozen_string_literal: true

module RubyApiPackCloudways
  module Constants
    CW_API_URL = 'https://api.cloudways.com/api/v1'
    CW_API_PATH_TOKEN = '/oauth/access_token'
    CW_API_EMAIL = ENV['PHCDEV_API_CLOUDWAYS_EMAIL']
    CW_API_KEY = ENV['PHCDEV_API_CLOUDWAYS_KEY']
  end
end
