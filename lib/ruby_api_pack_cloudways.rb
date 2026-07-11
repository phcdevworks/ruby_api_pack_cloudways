# frozen_string_literal: true

require 'ruby_api_pack_core'

require_relative 'ruby_api_pack_cloudways/configuration'
require_relative 'ruby_api_pack_cloudways/handlers/response_validator'
require_relative 'ruby_api_pack_cloudways/connection/cw_token'
require_relative 'ruby_api_pack_cloudways/connection/cw_connect'
require_relative 'ruby_api_pack_cloudways/api/cw_lists'
require_relative 'ruby_api_pack_cloudways/api/cw_server'

module RubyApiPackCloudways
  extend RubyApiPackCore::Configurable

  def self.configuration_class
    Configuration
  end
end
