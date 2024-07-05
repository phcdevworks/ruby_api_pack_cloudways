# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_server'
require 'ruby_api_pack_cloudways/constants'

# PHCDEVONE - RSpec describe block for the RubyApiPackCloudways::Api::CwServer class
RSpec.describe RubyApiPackCloudways::Api::CwServer do
  # PHCDEVONE - Include the RubyApiPackCloudways::Constants module
  include RubyApiPackCloudways::Constants

  # PHCDEVONE - Define a mock Faraday class double
  let(:mock_faraday) { class_double(Faraday) }

  # PHCDEVONE - Define a connection instance for CwConnect with mock Faraday and specific path
  let(:connection) do
    RubyApiPackCloudways::Connection::CwConnect.new(RubyApiPackCloudways::Constants::CW_API_URL, '/server',
                                                    mock_faraday)
  end

  # PHCDEVONE - Define a mock connection instance double for Faraday::Connection
  let(:mock_connection) { instance_double(Faraday::Connection) }

  # PHCDEVONE - Define the response body for the mock connection
  let(:response_body) { '{"servers":["server1"]}' }

  # PHCDEVONE - Set up the mock Faraday and connection before each test
  before do
    allow(mock_faraday).to receive(:new).and_return(mock_connection)
    allow(mock_connection).to receive(:get).and_return(
      instance_double(Faraday::Response, status: 200, body: response_body)
    )
  end

  # PHCDEVONE - Describe block for the .cw_server_list method
  describe '.cw_server_list' do
    # PHCDEVONE - It block to test the return of server list
    it 'returns a list of servers' do
      allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(connection)
      expect(described_class.cw_server_list).to eq(['server1'])
    end
  end
end
