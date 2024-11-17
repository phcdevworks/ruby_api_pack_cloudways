# frozen_string_literal: true

module RubyApiPackCloudways
  module Handlers
    module ResponseValidator
      def validate_response(response, expected_key)
        raise "Unexpected response format: #{response.inspect}" unless response.is_a?(Hash) && response.key?(expected_key)

        result = response[expected_key]
        raise "Expected '#{expected_key}' to be an Array, got #{result.class}: #{result.inspect}" unless result.is_a?(Array)

        result
      rescue StandardError => e
        log_error("Error validating response: #{e.message}")
        raise "An error occurred while processing the response: #{e.message}"
      end

      private

      def log_error(message)
        if defined?(Rails)
          Rails.logger.error(message)
        else
          puts "[ERROR] #{message}"
        end
      end
    end
  end
end
