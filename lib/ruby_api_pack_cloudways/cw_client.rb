# frozen_string_literal: true

require 'faraday'
require 'oj'

# Load API Files
require_relative 'connection/cw_token'
require_relative 'connection/cw_connect'
require_relative 'api/cw_lists'
require_relative 'api/cw_server'

module RubyApiPackCloudways
  class CwClient
    # Constants
    CW_API_URL = 'https://api.cloudways.com/api/v1'
    CW_API_PATH_TOKEN = '/oauth/access_token'
    CW_API_EMAIL = ENV['PHCDEV_API_CLOUDWAYS_EMAIL']
    CW_API_KEY = ENV['PHCDEV_API_CLOUDWAYS_KEY']
  end
end
