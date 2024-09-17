# frozen_string_literal: true

module RubyApiPackCloudways
  class Configuration
    attr_accessor :api_url, :api_path_token, :api_email, :api_key

    def initialize
      @api_url = 'https://api.cloudways.com/api/v1'
      @api_path_token = '/oauth/access_token'
      @api_email = nil
      @api_key = nil
    end
  end
end
