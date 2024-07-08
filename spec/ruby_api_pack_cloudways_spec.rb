# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RubyApiPackCloudways, :vcr do
  before do
    described_class.configure do |config|
      config.api_url = ENV['CLOUDWAYS_API_URL'] || 'https://api.cloudways.com/api/v1'
      config.api_path_token = ENV['CLOUDWAYS_API_PATH_TOKEN'] || '/oauth/access_token'
      config.api_email = ENV['CLOUDWAYS_API_EMAIL']
      config.api_key = ENV['CLOUDWAYS_API_KEY']
    end
  end

  describe RubyApiPackCloudways::Api::CwServer do
    it 'fetches the list of servers' do
      servers = described_class.cw_server_list
      expect(servers).to be_an(Array)
    end
  end

  describe RubyApiPackCloudways::Api::CwLists do
    it 'fetches the list of providers' do
      providers = described_class.cw_provider_list
      expect(providers).to be_an(Array)
    end

    it 'fetches the list of server sizes' do
      sizes = described_class.cw_server_size_list
      expect(sizes).to be_an(Array)
    end

    it 'fetches the list of apps' do
      apps = described_class.cw_app_list
      expect(apps).to be_an(Array)
    end

    it 'fetches the list of packages' do
      packages = described_class.cw_package_list
      expect(packages).to be_an(Array)
    end
  end
end
