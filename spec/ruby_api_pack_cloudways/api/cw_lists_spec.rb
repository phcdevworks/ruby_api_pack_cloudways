# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_lists'
require 'ruby_api_pack_cloudways/constants'

# PHCDEVONE - RSpec describe block for the RubyApiPackCloudways::Api::CwLists class
RSpec.describe RubyApiPackCloudways::Api::CwLists do
  # PHCDEVONE - Include the RubyApiPackCloudways::Constants module
  include RubyApiPackCloudways::Constants

  # PHCDEVONE - Define a mock Faraday class double
  let(:mock_faraday) { class_double(Faraday) }

  # PHCDEVONE - Define a connection instance for CwConnect with mock Faraday
  let(:connection) do
    RubyApiPackCloudways::Connection::CwConnect.new(RubyApiPackCloudways::Constants::CW_API_URL, '', mock_faraday)
  end

  # PHCDEVONE - Define a mock connection instance double for Faraday::Connection
  let(:mock_connection) { instance_double(Faraday::Connection) }

  # PHCDEVONE - Define the response body for the mock connection
  let(:response_body) do
    '{"providers":["provider1"],"sizes":["size1"],"apps":["app1"],"packages":["package1"]}'
  end

  # PHCDEVONE - Set up the mock Faraday and connection before each test
  before do
    allow(mock_faraday).to receive(:new).and_return(mock_connection)
    allow(mock_connection).to receive(:get).and_return(
      instance_double(Faraday::Response, status: 200, body: response_body)
    )
  end

  # PHCDEVONE - Describe block for the .cw_provider_list method
  describe '.cw_provider_list' do
    # PHCDEVONE - It block to test the return of provider list
    it 'returns a list of providers' do
      allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(connection)
      expect(described_class.cw_provider_list).to eq(['provider1'])
    end
  end

  # PHCDEVONE - Describe block for the .cw_server_size_list method
  describe '.cw_server_size_list' do
    # PHCDEVONE - It block to test the return of server sizes list
    it 'returns a list of server sizes' do
      allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(connection)
      expect(described_class.cw_server_size_list).to eq(['size1'])
    end
  end

  # PHCDEVONE - Describe block for the .cw_app_list method
  describe '.cw_app_list' do
    # PHCDEVONE - It block to test the return of apps list
    it 'returns a list of apps' do
      allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(connection)
      expect(described_class.cw_app_list).to eq(['app1'])
    end
  end

  # PHCDEVONE - Describe block for the .cw_package_list method
  describe '.cw_package_list' do
    # PHCDEVONE - It block to test the return of packages list
    it 'returns a list of packages' do
      allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(connection)
      expect(described_class.cw_package_list).to eq(['package1'])
    end
  end
end
