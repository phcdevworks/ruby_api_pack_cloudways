# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/connection/cw_token'

RSpec.describe RubyApiPackCloudways::Connection::CwToken do
  subject(:token) do
    described_class.new(mock_faraday)
  end

  let(:cw_api_url_base) { 'https://api.cloudways.com/api/v1' }
  let(:cw_url_path_auth) { '/oauth/access_token' }
  let(:credentials) do
    {
      email: 'email@example.com',
      key: 'api_key'
    }
  end

  let(:mock_faraday) { class_double(Faraday) }
  let(:mock_connection) { instance_double(Faraday::Connection) }

  before do
    RubyApiPackCloudways.configure do |config|
      config.api_url = cw_api_url_base
      config.api_path_token = cw_url_path_auth
      config.api_email = credentials[:email]
      config.api_key = credentials[:key]
    end
  end

  describe '#cw_api_token_connection' do
    before do
      allow(mock_faraday).to receive(:new).and_return(mock_connection)
    end

    it 'creates a Faraday connection' do
      token.cw_api_token_connection
      expect(mock_faraday).to have_received(:new).with(url: "#{cw_api_url_base}#{cw_url_path_auth}")
    end

    it 'returns the Faraday connection instance' do
      connection = token.cw_api_token_connection
      expect(connection).to eq(mock_connection)
    end
  end

  describe '#cw_api_token' do
    before do
      allow(mock_faraday).to receive(:new).and_return(mock_connection)
      allow(mock_connection).to receive(:post).and_return(
        instance_double(Faraday::Response, body: '{"access_token":"fake_token"}')
      )
    end

    it 'returns an access token' do
      token_result = token.cw_api_token
      expect(token_result).to eq('fake_token')
    end

    it 'calls the correct endpoint' do
      token.cw_api_token
      expect(mock_connection).to have_received(:post)
    end
  end
end
