# frozen_string_literal: true

module RubyApiPackCloudways
  module Api
    class CwLists
      # List endpoints
      ENDPOINTS = {
        apps: '/apps',
        backup_frequencies: '/backup-frequencies',
        countries: '/countries',
        monitor_durations: '/monitoring/durations',
        monitor_targets: '/monitoring/targets',
        packages: '/packages',
        providers: '/providers',
        regions: '/regions',
        server_sizes: '/server_sizes',
        settings: '/settings'
      }.freeze

      # Fetch list of applications available
      def self.app_list
        fetch_resource(ENDPOINTS[:apps])['apps']
      end

      # Fetch list of available backup frequencies
      def self.backup_frequency_list
        fetch_resource(ENDPOINTS[:backup_frequencies])['frequencies']
      end

      # Fetch list of supported countries
      def self.country_list
        fetch_resource(ENDPOINTS[:countries])['countries']
      end

      # Fetch list of monitoring durations
      def self.monitor_duration_list
        fetch_resource(ENDPOINTS[:monitor_durations])['durations']
      end

      # Fetch list of monitoring targets
      def self.monitor_target_list
        fetch_resource(ENDPOINTS[:monitor_targets])['targets']
      end

      # Fetch list of available packages
      def self.package_list
        fetch_resource(ENDPOINTS[:packages])['packages']
      end

      # Fetch list of providers
      def self.provider_list
        fetch_resource(ENDPOINTS[:providers])['providers']
      end

      # Fetch list of regions
      def self.region_list
        fetch_resource(ENDPOINTS[:regions])['regions']
      end

      # Fetch list of server sizes
      def self.server_size_list
        fetch_resource(ENDPOINTS[:server_sizes])['sizes']
      end

      # Fetch list of available settings
      def self.setting_list
        fetch_resource(ENDPOINTS[:settings])['settings']
      end

      # Private method to fetch resources from a specified endpoint
      private_class_method def self.fetch_resource(endpoint)
        Connection::CwConnect.new(
          RubyApiPackCloudways.configuration.api_url,
          endpoint
        ).cloudways_api_connection
      end
    end
  end
end
