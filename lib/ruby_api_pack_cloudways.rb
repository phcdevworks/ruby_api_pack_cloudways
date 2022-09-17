require "ruby_api_pack_cloudways/version"

module RubyApiPackCloudways
  class Error < StandardError; end
  require_relative "ruby_api_pack_cloudways/cw_client"
end
