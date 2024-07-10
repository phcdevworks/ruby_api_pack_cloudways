# frozen_string_literal: true

# PHCDEVONE - Require the main gem file
require 'ruby_api_pack_cloudways'
# PHCDEVONE - Require VCR for recording HTTP interactions
require 'vcr'
# PHCDEVONE - Require WebMock to mock HTTP requests
require 'webmock/rspec'

# PHCDEVONE - Configure VCR
VCR.configure do |config|
  # PHCDEVONE - Set the directory where VCR cassettes will be stored
  config.cassette_library_dir = 'spec/vcr_cassettes'
  # PHCDEVONE - Hook into WebMock to intercept HTTP requests
  config.hook_into :webmock
  # PHCDEVONE - Automatically configure RSpec metadata
  config.configure_rspec_metadata!
  # PHCDEVONE - Allow HTTP connections when no cassette is available
  config.allow_http_connections_when_no_cassette = true
end

# PHCDEVONE - Configure RSpec
RSpec.configure do |config|
  # PHCDEVONE - Before the entire test suite runs
  config.before(:suite) do
    # PHCDEVONE - Configure the RubyApiPackCloudways gem with necessary credentials
    RubyApiPackCloudways.configure do |c|
      c.api_url = 'https://api.cloudways.com/api/v1'
      c.api_path_token = '/oauth/access_token'
      c.api_email = ENV['CLOUDWAYS_API_EMAIL']
      c.api_key = ENV['CLOUDWAYS_API_KEY']
    end
  end

  # PHCDEVONE - Before each test runs
  config.before do
    # PHCDEVONE - Ensure environment variables are set
    puts "CLOUDWAYS_API_URL: #{ENV['CLOUDWAYS_API_URL']}"
    puts "CLOUDWAYS_API_PATH_TOKEN: #{ENV['CLOUDWAYS_API_PATH_TOKEN']}"
    puts "CLOUDWAYS_API_EMAIL: #{ENV['CLOUDWAYS_API_EMAIL']}"
    puts "CLOUDWAYS_API_KEY: #{ENV['CLOUDWAYS_API_KEY']}"

    # PHCDEVONE - Stub the request to the Cloudways token endpoint
    stub_request(:post, 'https://api.cloudways.com/api/v1/oauth/access_token')
      .with(
        body: { email: ENV['CLOUDWAYS_API_EMAIL'], api_key: ENV['CLOUDWAYS_API_KEY'] },
        headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
      ).to_return(status: 200, body: '{"access_token":"fake_token"}', headers: {})
  end
end
