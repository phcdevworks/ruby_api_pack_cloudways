# frozen_string_literal: true

require 'faraday'
require 'oj'

# PHCDEVONE - Load API Files
require_relative 'connection/cw_token'
require_relative 'connection/cw_connect'
require_relative 'api/cw_lists'
require_relative 'api/cw_server'
require_relative 'constants'

module RubyApiPackCloudways
  class CwClient
    # PHCDEVONE - Include the RubyApiPackCloudways::Constants module
    include RubyApiPackCloudways::Constants
  end
end
