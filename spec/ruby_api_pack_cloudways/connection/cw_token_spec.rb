# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/connection/cw_token'

RSpec.describe RubyApiPackCloudways::Connection::CwToken do
  let(:token) { described_class.new }
  let(:valid_response) do
    instance_double(
      HTTParty::Response,
      code: 200,
      body: '{"access_token":"fake_token", "expires_in": 3600}', # Includes "expires_in"
      headers: { 'content-type' => 'application/json' }
    )
  end
  let(:error_response) do
    instance_double(
      HTTParty::Response,
      code: 500,
      body: '{"error":"Invalid request"}',
      headers: { 'content-type' => 'application/json' }
    )
  end

  before do
    RubyApiPackCloudways.configure do |config|
      config.api_url = 'https://api.cloudways.com/api/v1'
      config.api_path_token = '/oauth/access_token'
      config.api_email = 'test@example.com'
      config.api_key = 'test_key'
    end

    allow(HTTParty).to receive(:post).and_return(valid_response)
  end

  describe '#cw_api_token' do
    context 'when a valid cached token exists' do
      before do
        allow(token).to receive(:valid_cached_token?).and_return(true)
        token.instance_variable_set(:@cached_token, 'cached_token')
      end

      it 'returns the cached token without making an HTTP request' do
        expect(HTTParty).not_to receive(:post)
        expect(token.cw_api_token).to eq('cached_token')
      end
    end

    context 'when no cached token exists or it is expired' do
      it 'fetches a new token and returns it' do
        expect(token.cw_api_token).to eq('fake_token')
      end
    end

    context 'when the response code is not 200' do
      before do
        allow(HTTParty).to receive(:post).and_return(error_response)
      end

      it 'raises an error with the response code' do
        expect { token.cw_api_token }.to raise_error(RuntimeError, /Failed to fetch token: 500/)
      end
    end

    context 'when the cached token is expired' do
      before do
        token.instance_variable_set(:@cached_token, 'expired_token')
        token.instance_variable_set(:@token_expiry, Time.now - 3600) # Token expired an hour ago
      end

      it 'fetches a new token' do
        expect(token.cw_api_token).to eq('fake_token')
      end
    end
  end

  describe '#parse_response' do
    let(:valid_response) { instance_double(HTTParty::Response, body: '{"key":"value"}') }
    let(:invalid_response) { instance_double(HTTParty::Response, body: 'invalid_json') }

    it 'parses the response body successfully' do
      expect(token.send(:parse_response, valid_response)).to eq({ 'key' => 'value' })
    end

    it 'raises an error when parsing fails' do
      allow(Oj).to receive(:load).and_raise(Oj::ParseError, 'Unexpected character')
      expect do
        token.send(:parse_response, invalid_response)
      end.to raise_error(RuntimeError, /Error parsing response: Unexpected character/)
    end
  end
end
