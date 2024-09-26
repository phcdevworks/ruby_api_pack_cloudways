# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/connection/cw_connect'

RSpec.describe RubyApiPackCloudways::Connection::CwConnect do
  let(:connection) { described_class.new('https://api.cloudways.com/api/v1', '/some_path') }
  let(:token_instance) { instance_double(RubyApiPackCloudways::Connection::CwToken, cw_api_token: 'fake_token') }
  let(:http_response) { instance_double(HTTParty::Response, code: 200, body: '{"data":"value"}') }

  before do
    allow(RubyApiPackCloudways::Connection::CwToken).to receive(:new).and_return(token_instance)
    allow(HTTParty).to receive(:get).and_return(http_response)
  end

  describe '#cloudways_api_connection' do
    it 'creates a HTTParty GET connection' do
      connection.cloudways_api_connection

      expect(HTTParty).to have_received(:get).with(
        'https://api.cloudways.com/api/v1/some_path',
        headers: { 'Authorization' => 'Bearer fake_token' }
      )
    end

    it 'returns a successful response' do
      response = connection.cloudways_api_connection
      expect(response['data']).to eq('value')
    end

    context 'when the response code is not 200' do
      let(:error_response) { instance_double(HTTParty::Response, code: 500, body: '{"error":"Server error"}') }

      before do
        allow(HTTParty).to receive(:get).and_return(error_response)
      end

      it 'raises an error with the response code' do
        expect { connection.cloudways_api_connection }.to raise_error('Error: Received status 500')
      end
    end

    context 'when parsing the response fails' do
      let(:faulty_response) { instance_double(HTTParty::Response, code: 200, body: 'invalid_json') }

      before do
        allow(HTTParty).to receive(:get).and_return(faulty_response)
        allow(Oj).to receive(:load).and_raise(Oj::ParseError.new('Unexpected character'))
      end

      it 'raises a parsing error' do
        expect { connection.cloudways_api_connection }.to raise_error(/Error parsing response: Unexpected character/)
      end
    end
  end
end
