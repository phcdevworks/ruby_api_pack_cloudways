# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways'

RSpec.describe RubyApiPackCloudways do
  it 'has a version number' do
    expect(RubyApiPackCloudways::VERSION).not_to be_nil
  end

  describe '.configure' do
    before do
      RubyApiPackCloudways.configure do |config|
        config.api_url = 'https://api.cloudways.com/api/v1'
        config.api_path_token = '/oauth/access_token'
        config.api_email = 'email@example.com'
        config.api_key = 'api_key'
      end
    end

    it 'sets the api_url correctly' do
      expect(RubyApiPackCloudways.configuration.api_url).to eq('https://api.cloudways.com/api/v1')
    end

    it 'sets the api_path_token correctly' do
      expect(RubyApiPackCloudways.configuration.api_path_token).to eq('/oauth/access_token')
    end

    it 'sets the api_email correctly' do
      expect(RubyApiPackCloudways.configuration.api_email).to eq('email@example.com')
    end

    it 'sets the api_key correctly' do
      expect(RubyApiPackCloudways.configuration.api_key).to eq('api_key')
    end
  end
end
