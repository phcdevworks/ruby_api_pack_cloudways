# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/connection/cw_connect'

RSpec.describe RubyApiPackCloudways::Connection::CwConnect do
  let(:connection) { described_class.new('https://api.cloudways.com/api/v1', '/some_path') }

  before do
    allow(RubyApiPackCloudways::Connection::CwToken).to receive(:new).and_return(instance_double(RubyApiPackCloudways::Connection::CwToken, cw_api_token: 'fake_token'))
  end

  describe '#cloudways_api_connection' do
    it 'creates a HTTParty connection' do
      allow(HTTParty).to receive(:get).and_return(instance_double(HTTParty::Response, code: 200, body: '{"data":"value"}'))
      connection.cloudways_api_connection
      expect(HTTParty).to have_received(:get).with('https://api.cloudways.com/api/v1/some_path', headers: { 'Authorization' => 'Bearer fake_token' })
    end

    it 'returns a successful response' do
      allow(HTTParty).to receive(:get).and_return(instance_double(HTTParty::Response, code: 200, body: '{"data":"value"}'))
      response = connection.cloudways_api_connection
      expect(response['data']).to eq('value')
    end
  end
end
