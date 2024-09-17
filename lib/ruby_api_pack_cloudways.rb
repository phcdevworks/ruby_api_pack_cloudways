# frozen_string_literal: true

require 'httparty'
require 'oj'

require_relative 'ruby_api_pack_cloudways/configuration'
require_relative 'ruby_api_pack_cloudways/connection/cw_token'
require_relative 'ruby_api_pack_cloudways/connection/cw_connect'
require_relative 'ruby_api_pack_cloudways/api/cw_lists'
require_relative 'ruby_api_pack_cloudways/api/cw_server'

module RubyApiPackCloudways
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end
