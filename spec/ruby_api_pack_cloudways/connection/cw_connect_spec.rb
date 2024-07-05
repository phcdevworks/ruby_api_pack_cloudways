# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/connection/cw_connect'
require 'ruby_api_pack_cloudways/constants'

RSpec.describe RubyApiPackCloudways::Connection::CwConnect do
  include RubyApiPackCloudways::Constants

  subject(:connection) { described_class.new(cw_api_url_base, cw_api_path, mock_faraday) }

  let(:cw_api_url_base) { RubyApiPackCloudways::Constants::CW_API_URL }
  let(:cw_api_path) { '/some_path' }
  let(:mock_token) { 'fake_token' }
  let(:response_body) { '{"data":"value"}' }

  let(:mock_faraday) { class_double(Faraday) }

  before do
    allow(RubyApiPackCloudways::Connection::CwToken).to receive(:new)
      .and_return(instance_double(RubyApiPackCloudways::Connection::CwToken, cw_api_token: mock_token))
    allow(mock_faraday).to receive(:new).and_return(instance_double(Faraday::Connection,
                                                                    get: instance_double(Faraday::Response,
                                                                                         status: 200, body: response_body)))
  end

  describe '#cloudways_api_connection' do
    it 'creates a Faraday connection' do
      connection.cloudways_api_connection
      expect(mock_faraday).to have_received(:new).with(url: cw_api_url_base)
    end

    it 'returns a successful response' do
      response = connection.cloudways_api_connection
      expect(response['data']).to eq('value')
    end
  end
end
