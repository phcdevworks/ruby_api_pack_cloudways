# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_lists'

RSpec.describe RubyApiPackCloudways::Api::CwLists do
  let(:mock_cw_connect) { instance_double(RubyApiPackCloudways::Connection::CwConnect) }

  before do
    allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(mock_cw_connect)
    allow(mock_cw_connect).to receive(:cloudways_api_connection).and_return(
      'providers' => ['provider1'], 'sizes' => ['size1'], 'apps' => ['app1'], 'packages' => ['package1']
    )
  end

  describe '.cw_provider_list' do
    it 'returns a list of providers' do
      expect(described_class.cw_provider_list).to eq(['provider1'])
    end
  end

  describe '.cw_server_size_list' do
    it 'returns a list of server sizes' do
      expect(described_class.cw_server_size_list).to eq(['size1'])
    end
  end

  describe '.cw_app_list' do
    it 'returns a list of apps' do
      expect(described_class.cw_app_list).to eq(['app1'])
    end
  end

  describe '.cw_package_list' do
    it 'returns a list of packages' do
      expect(described_class.cw_package_list).to eq(['package1'])
    end
  end
end
