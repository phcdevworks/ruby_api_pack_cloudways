# frozen_string_literal: true

module RubyApiPackCloudways
  module Api
    class CwServer
      # Server endpoints
      ENDPOINTS = {
        list: '/server',
        attach_block_storage: '/server/attach_block_storage',
        clone: '/server/clone',
        create: '/server/create',
        delete: '/server/delete',
        details: '/server/details',
        disk_usage: '/server/disk_usage',
        restart: '/server/restart',
        scale_block_storage: '/server/scale_block_storage',
        scale_volume_size: '/server/scale_volume_size',
        start: '/server/start',
        stop: '/server/stop',
        update_label: '/server/update_label',
        upgrade: '/server/upgrade'
      }.freeze

      # List all servers
      def self.server_list
        fetch_list(ENDPOINTS[:list])['servers']
      end

      # Attach block storage to a server
      def self.attach_block_storage(server_id, params)
        post_with_id(ENDPOINTS[:attach_block_storage], server_id, params)
      end

      # Clone a server
      def self.clone_server(server_id, params)
        post_with_id(ENDPOINTS[:clone], server_id, params)
      end

      # Create a new server
      def self.create_server(params)
        post_without_id(ENDPOINTS[:create], params)
      end

      # Delete a server
      def self.delete_server(server_id)
        fetch_with_id(ENDPOINTS[:delete], server_id)
      end

      # Get disk usage information
      def self.disk_usage(server_id)
        fetch_with_id(ENDPOINTS[:disk_usage], server_id)
      end

      # Restart a server
      def self.restart_server(server_id)
        fetch_with_id(ENDPOINTS[:restart], server_id)
      end

      # Get server details
      def self.server_details(server_id)
        fetch_with_id(ENDPOINTS[:details], server_id)
      end

      # Scale block storage of a server
      def self.scale_block_storage(server_id, params)
        post_with_id(ENDPOINTS[:scale_block_storage], server_id, params)
      end

      # Scale volume size of a server
      def self.scale_volume_size(server_id, params)
        post_with_id(ENDPOINTS[:scale_volume_size], server_id, params)
      end

      # Start a server
      def self.start_server(server_id)
        fetch_with_id(ENDPOINTS[:start], server_id)
      end

      # Stop a server
      def self.stop_server(server_id)
        fetch_with_id(ENDPOINTS[:stop], server_id)
      end

      # Update server label
      def self.update_server_label(server_id, params)
        post_with_id(ENDPOINTS[:update_label], server_id, params)
      end

      # Upgrade a server
      def self.upgrade_server(server_id, params)
        post_with_id(ENDPOINTS[:upgrade], server_id, params)
      end

      # Private methods to fetch data
      private_class_method def self.fetch_list(endpoint)
        Connection::CwConnect.new(RubyApiPackCloudways.configuration.api_url, endpoint).cloudways_api_connection
      end

      # Private methods to fetch data with server id
      private_class_method def self.fetch_with_id(endpoint, server_id)
        Connection::CwConnect.new(RubyApiPackCloudways.configuration.api_url, "#{endpoint}/#{server_id}")
                             .cloudways_api_connection
      end

      # Private methods to post data with server id
      private_class_method def self.post_with_id(endpoint, server_id, params)
        connection = Connection::CwConnect.new(RubyApiPackCloudways.configuration.api_url, "#{endpoint}/#{server_id}")
        connection.cloudways_api_post_connection(params)
      end

      # Private methods to post data without server id
      private_class_method def self.post_without_id(endpoint, params)
        connection = Connection::CwConnect.new(RubyApiPackCloudways.configuration.api_url, endpoint)
        connection.cloudways_api_post_connection(params)
      end
    end
  end
end
