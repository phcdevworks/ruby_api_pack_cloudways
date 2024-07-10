# frozen_string_literal: true

# PHCDEVONE - Load Required Gems
require 'httparty'
require 'oj'

# PHCDEVONE - Load Configuration and API Files
require_relative 'ruby_api_pack_cloudways/configuration'
require_relative 'ruby_api_pack_cloudways/connection/cw_token'
require_relative 'ruby_api_pack_cloudways/connection/cw_connect'
require_relative 'ruby_api_pack_cloudways/api/cw_lists'
require_relative 'ruby_api_pack_cloudways/api/cw_server'

# PHCDEVONE - Define the main module for the Ruby API Pack Cloudways
module RubyApiPackCloudways
  class << self
    # PHCDEVONE - Define an accessor for the configuration
    attr_accessor :configuration

    # PHCDEVONE - Method to configure the gem
    def configure
      # PHCDEVONE - Initialize the configuration if it hasn't been already
      self.configuration ||= Configuration.new
      # PHCDEVONE - Yield the configuration to the block provided by the caller
      yield(configuration)
    end
  end
end
