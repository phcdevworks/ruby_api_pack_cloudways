# frozen_string_literal: true

require 'faraday'
require 'oj'

# Load API Files
require_relative 'connection/cw_token'
require_relative 'connection/cw_connect'
require_relative 'api/cw_lists'
require_relative 'api/cw_server'
require_relative 'constants'

module RubyApiPackCloudways
  class CwClient
    include RubyApiPackCloudways::Constants
  end
end
