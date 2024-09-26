# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_lists'

RSpec.describe RubyApiPackCloudways::Api::CwLists do
  let(:cw_connect_instance) { instance_double(RubyApiPackCloudways::Connection::CwConnect) }

  before do
    allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(cw_connect_instance)
  end

  describe '.provider_list' do
    it 'returns a list of providers' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'providers' => ['provider1']
      )

      providers = described_class.provider_list
      expect(providers).to eq(['provider1'])
    end
  end

  describe '.server_size_list' do
    it 'returns a list of server sizes' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'sizes' => ['size1']
      )

      sizes = described_class.server_size_list
      expect(sizes).to eq(['size1'])
    end
  end

  describe '.app_list' do
    it 'returns a list of apps' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'apps' => ['app1']
      )

      apps = described_class.app_list
      expect(apps).to eq(['app1'])
    end
  end

  describe '.package_list' do
    it 'returns a list of packages' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'packages' => ['package1']
      )

      packages = described_class.package_list
      expect(packages).to eq(['package1'])
    end
  end
end
