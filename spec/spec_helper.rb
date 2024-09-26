# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter 'lib/ruby_api_pack_cloudways/version'
  track_files 'lib/ruby_api_pack_cloudways/**/*.rb'
  enable_coverage :branch
end

require 'ruby_api_pack_cloudways'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.before(:suite) do
    RubyApiPackCloudways.configure do |c|
      c.api_url = 'https://api.cloudways.com/api/v1'
      c.api_path_token = '/oauth/access_token'
      c.api_email = ENV['CLOUDWAYS_API_EMAIL']
      c.api_key = ENV['CLOUDWAYS_API_KEY']
    end
  end
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.before do
    puts "CLOUDWAYS_API_URL: #{ENV['CLOUDWAYS_API_URL']}"
    puts "CLOUDWAYS_API_PATH_TOKEN: #{ENV['CLOUDWAYS_API_PATH_TOKEN']}"
    puts "CLOUDWAYS_API_EMAIL: #{ENV['CLOUDWAYS_API_EMAIL']}"
    puts "CLOUDWAYS_API_KEY: #{ENV['CLOUDWAYS_API_KEY']}"

    stub_request(:post, 'https://api.cloudways.com/api/v1/oauth/access_token')
      .with(
        body: { email: ENV['CLOUDWAYS_API_EMAIL'], api_key: ENV['CLOUDWAYS_API_KEY'] },
        headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
      ).to_return(status: 200, body: '{"access_token":"fake_token"}', headers: {})
  end
end
