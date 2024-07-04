# frozen_string_literal: true

# /lib/ruby_api_pack_cloudways/api/cw_lists.rb

module RubyApiPackCloudways
  module Api
    class CwLists
      def self.cw_provider_list
        fetch_list('/providers')['providers']
      end

      def self.cw_server_size_list
        fetch_list('/server_sizes')['sizes']
      end

      def self.cw_app_list
        fetch_list('/apps')['apps']
      end

      def self.cw_package_list
        fetch_list('/packages')['packages']
      end

      def self.fetch_list(endpoint)
        Connection::CwConnect.new(CW_API_URL, endpoint).cloudways_api_connection
      end
    end
  end
end
