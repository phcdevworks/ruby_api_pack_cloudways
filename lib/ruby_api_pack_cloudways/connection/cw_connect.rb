# frozen_string_literal: true

require 'ruby_api_pack_core'
require 'openssl'

module RubyApiPackCloudways
  module Connection
    class CwConnect < RubyApiPackCore::Connection::Base
      # GET request to Cloudways API, retrying after a rate limit cool-down.
      def api_get(params = {})
        super
      rescue RuntimeError => e
        raise unless e.message.include?('Rate limit exceeded')

        sleep(60)
        retry
      end

      # Backward-compatible aliases for the pre-core method names.
      alias cloudways_api_connection api_get
      alias cloudways_api_post_connection api_post

      private

      def auth_headers
        { 'Authorization' => "Bearer #{CwToken.new.cw_api_token}" }
      end
    end
  end
end
