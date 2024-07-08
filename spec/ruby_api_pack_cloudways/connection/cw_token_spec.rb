# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_server'

RSpec.describe RubyApiPackCloudways::Api::CwServer do
  let(:cw_connect_instance) { instance_double(RubyApiPackCloudways::Connection::CwConnect) }

  before do
    allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(cw_connect_instance)
    allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return('servers' => ['server1'])
  end

  describe '.cw_server_list' do
    it 'returns a list of servers' do
      servers = described_class.cw_server_list
      expect(servers).to eq(['server1'])
    end
  end
end
