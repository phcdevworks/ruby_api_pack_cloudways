# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/connection/cw_connect'
require 'ruby_api_pack_cloudways/constants'

# PHCDEVONE - RSpec describe block for the RubyApiPackCloudways::Connection::CwConnect class
RSpec.describe RubyApiPackCloudways::Connection::CwConnect do
  # PHCDEVONE - Include the RubyApiPackCloudways::Constants module
  include RubyApiPackCloudways::Constants

  # PHCDEVONE - Subject block defining the connection instance for tests
  subject(:connection) { described_class.new(connection_params[:url_base], connection_params[:path], mock_faraday) }

  # PHCDEVONE - Define connection parameters including the base URL and path
  let(:connection_params) do
    {
      url_base: RubyApiPackCloudways::Constants::CW_API_URL,
      path: '/some_path'
    }
  end

  # PHCDEVONE - Define a mock token for authentication
  let(:mock_token) { 'fake_token' }

  # PHCDEVONE - Define the response body for the mock connection
  let(:response_body) { '{"data":"value"}' }

  # PHCDEVONE - Define a mock Faraday class double
  let(:mock_faraday) { class_double(Faraday) }

  # PHCDEVONE - Define a mock connection instance double for Faraday::Connection
  let(:mock_connection) { instance_double(Faraday::Connection) }

  # PHCDEVONE - Set up mocks for Faraday and token before each test
  before do
    allow(RubyApiPackCloudways::Connection::CwToken).to receive(:new)
      .and_return(instance_double(RubyApiPackCloudways::Connection::CwToken, cw_api_token: mock_token))
    allow(mock_faraday).to receive(:new).and_return(
      instance_double(Faraday::Connection,
                      get: instance_double(Faraday::Response, status: 200, body: response_body))
    )
  end

  # PHCDEVONE - Describe block for the #cloudways_api_connection method
  describe '#cloudways_api_connection' do
    # PHCDEVONE - It block to test the creation of a Faraday connection
    it 'creates a Faraday connection' do
      connection.cloudways_api_connection
      expect(mock_faraday).to have_received(:new).with(url: connection_params[:url_base])
    end

    # PHCDEVONE - It block to test the successful response from the connection
    it 'returns a successful response' do
      response = connection.cloudways_api_connection
      expect(response['data']).to eq('value')
    end
  end
end
