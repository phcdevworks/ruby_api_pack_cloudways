# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'RubyApiPackCloudways Integration Test', :vcr do
  before do
    RubyApiPackCloudways.configure do |config|
      config.api_url = ENV['CLOUDWAYS_API_URL'] || 'https://api.cloudways.com/api/v1'
      config.api_path_token = ENV['CLOUDWAYS_API_PATH_TOKEN'] || '/oauth/access_token'
      config.api_email = ENV['CLOUDWAYS_API_EMAIL']
      config.api_key = ENV['CLOUDWAYS_API_KEY']
    end
  end

  describe 'CwServer' do
    it 'fetches the list of servers' do
      servers = RubyApiPackCloudways::Api::CwServer.cw_server_list
      expect(servers).to be_an(Array)
    end
  end

  describe 'CwLists' do
    it 'fetches the list of providers' do
      providers = RubyApiPackCloudways::Api::CwLists.cw_provider_list
      expect(providers).to be_an(Array)
    end

    it 'fetches the list of server sizes' do
      sizes = RubyApiPackCloudways::Api::CwLists.cw_server_size_list
      expect(sizes).to be_a(Hash)
    end

    it 'fetches the list of apps' do
      apps = RubyApiPackCloudways::Api::CwLists.cw_app_list
      expect(apps).to be_a(Hash)
    end

    it 'fetches the list of packages' do
      packages = RubyApiPackCloudways::Api::CwLists.cw_package_list
      expect(packages).to be_a(Hash)
    end
  end
end
