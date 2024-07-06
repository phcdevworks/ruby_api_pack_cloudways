# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_lists'

RSpec.describe RubyApiPackCloudways::Api::CwLists do
  before do
    allow_any_instance_of(RubyApiPackCloudways::Connection::CwConnect).to receive(:cloudways_api_connection).and_return(
      'providers' => ['provider1'],
      'sizes' => ['size1'],
      'apps' => ['app1'],
      'packages' => ['package1']
    )
  end

  describe '.cw_provider_list' do
    it 'returns a list of providers' do
      providers = described_class.cw_provider_list
      expect(providers).to eq(['provider1'])
    end
  end

  describe '.cw_server_size_list' do
    it 'returns a list of server sizes' do
      sizes = described_class.cw_server_size_list
      expect(sizes).to eq(['size1'])
    end
  end

  describe '.cw_app_list' do
    it 'returns a list of apps' do
      apps = described_class.cw_app_list
      expect(apps).to eq(['app1'])
    end
  end

  describe '.cw_package_list' do
    it 'returns a list of packages' do
      packages = described_class.cw_package_list
      expect(packages).to eq(['package1'])
    end
  end
end
