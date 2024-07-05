# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_server'
require 'ruby_api_pack_cloudways/constants'

RSpec.describe RubyApiPackCloudways::Api::CwServer do
  include RubyApiPackCloudways::Constants

  let(:mock_faraday) { class_double(Faraday) }
  let(:connection) do
    RubyApiPackCloudways::Connection::CwConnect.new(RubyApiPackCloudways::Constants::CW_API_URL, '/server',
                                                    mock_faraday)
  end
  let(:mock_connection) { instance_double(Faraday::Connection) }
  let(:response_body) { '{"servers":["server1"]}' }

  before do
    allow(mock_faraday).to receive(:new).and_return(mock_connection)
    allow(mock_connection).to receive(:get).and_return(
      instance_double(Faraday::Response, status: 200, body: response_body)
    )
  end

  describe '.cw_server_list' do
    it 'returns a list of servers' do
      allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(connection)
      expect(described_class.cw_server_list).to eq(['server1'])
    end
  end
end
