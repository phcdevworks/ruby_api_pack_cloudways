# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_lists'
require 'ruby_api_pack_cloudways/constants'

RSpec.describe RubyApiPackCloudways::Api::CwLists do
  include RubyApiPackCloudways::Constants

  let(:mock_faraday) { class_double(Faraday) }
  let(:connection) do
    RubyApiPackCloudways::Connection::CwConnect.new(RubyApiPackCloudways::Constants::CW_API_URL, '', mock_faraday)
  end
  let(:mock_connection) { instance_double(Faraday::Connection) }
  let(:response_body) do
    '{"providers":["provider1"],"sizes":["size1"],"apps":["app1"],"packages":["package1"]}'
  end

  before do
    allow(mock_faraday).to receive(:new).and_return(mock_connection)
    allow(mock_connection).to receive(:get).and_return(
      instance_double(Faraday::Response, status: 200, body: response_body)
    )
  end

  describe '.cw_provider_list' do
    it 'returns a list of providers' do
      allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(connection)
      expect(described_class.cw_provider_list).to eq(['provider1'])
    end
  end

  describe '.cw_server_size_list' do
    it 'returns a list of server sizes' do
      allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(connection)
      expect(described_class.cw_server_size_list).to eq(['size1'])
    end
  end

  describe '.cw_app_list' do
    it 'returns a list of apps' do
      allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(connection)
      expect(described_class.cw_app_list).to eq(['app1'])
    end
  end

  describe '.cw_package_list' do
    it 'returns a list of packages' do
      allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(connection)
      expect(described_class.cw_package_list).to eq(['package1'])
    end
  end
end
