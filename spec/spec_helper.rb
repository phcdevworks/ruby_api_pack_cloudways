# frozen_string_literal: true

require 'ruby_api_pack_cloudways'

RSpec.configure do |config|
  config.before(:suite) do
    RubyApiPackCloudways.configure do |c|
      c.api_url = 'https://api.cloudways.com/api/v1'
      c.api_path_token = '/oauth/access_token'
      c.api_email = ENV['CLOUDWAYS_API_EMAIL']
      c.api_key = ENV['CLOUDWAYS_API_KEY']
    end
  end
end
