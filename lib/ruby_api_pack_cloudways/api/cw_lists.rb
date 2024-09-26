# frozen_string_literal: true

module RubyApiPackCloudways
  module Api
    class CwLists
      def self.fetch_resource(endpoint)
        Connection::CwConnect.new(
          RubyApiPackCloudways.configuration.api_url,
          endpoint
        ).cloudways_api_connection
      end

      def self.provider_list
        fetch_resource('/providers')['providers']
      end

      def self.server_size_list
        fetch_resource('/server_sizes')['sizes']
      end

      def self.app_list
        fetch_resource('/apps')['apps']
      end

      def self.package_list
        fetch_resource('/packages')['packages']
      end
    end
  end
end
