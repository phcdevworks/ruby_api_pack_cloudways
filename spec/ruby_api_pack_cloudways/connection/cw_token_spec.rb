# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/connection/cw_token'
require 'ruby_api_pack_cloudways/constants'

# PHCDEVONE - RSpec describe block for the RubyApiPackCloudways::Connection::CwToken class
RSpec.describe RubyApiPackCloudways::Connection::CwToken do
  # PHCDEVONE - Include the RubyApiPackCloudways::Constants module
  include RubyApiPackCloudways::Constants

  # PHCDEVONE - Subject block defining the token instance for tests
  subject(:token) do
    described_class.new(cw_api_url_base, cw_url_path_auth, credentials[:email], credentials[:key], mock_faraday)
  end

  # PHCDEVONE - Define the base URL for the Cloudways API
  let(:cw_api_url_base) { RubyApiPackCloudways::Constants::CW_API_URL }

  # PHCDEVONE - Define the authentication path for the Cloudways API
  let(:cw_url_path_auth) { RubyApiPackCloudways::Constants::CW_API_PATH_TOKEN }

  # PHCDEVONE - Define the credentials including email and key
  let(:credentials) do
    {
      email: RubyApiPackCloudways::Constants::CW_API_EMAIL,
      key: RubyApiPackCloudways::Constants::CW_API_KEY
    }
  end

  # PHCDEVONE - Define a mock Faraday class double
  let(:mock_faraday) { class_double(Faraday) }

  # PHCDEVONE - Define a mock connection instance double for Faraday::Connection
  let(:mock_connection) { instance_double(Faraday::Connection) }

  # PHCDEVONE - Describe block for the #cw_api_token_connection method
  describe '#cw_api_token_connection' do
    # PHCDEVONE - Set up mock Faraday connection before each test
    before do
      allow(mock_faraday).to receive(:new).and_return(mock_connection)
    end

    # PHCDEVONE - It block to test the creation of a Faraday connection
    it 'creates a Faraday connection' do
      token.cw_api_token_connection
      expect(mock_faraday).to have_received(:new).with(url: "#{cw_api_url_base}#{cw_url_path_auth}")
    end

    # PHCDEVONE - It block to test the return of the Faraday connection instance
    it 'returns the Faraday connection instance' do
      connection = token.cw_api_token_connection
      expect(connection).to eq(mock_connection)
    end
  end

  # PHCDEVONE - Describe block for the #cw_api_token method
  describe '#cw_api_token' do
    # PHCDEVONE - Set up mocks for Faraday and token before each test
    before do
      allow(mock_faraday).to receive(:new).and_return(mock_connection)
      allow(mock_connection).to receive(:post).and_return(
        instance_double(Faraday::Response, body: '{"access_token":"fake_token"}')
      )
    end

    # PHCDEVONE - It block to test the return of an access token
    it 'returns an access token' do
      token_result = token.cw_api_token
      expect(token_result).to eq('fake_token')
    end

    # PHCDEVONE - It block to test the correct endpoint is called
    it 'calls the correct endpoint' do
      token.cw_api_token
      expect(mock_connection).to have_received(:post)
    end
  end
end
