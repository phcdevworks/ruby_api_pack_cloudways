# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_server'

RSpec.describe RubyApiPackCloudways::Api::CwServer do
  describe '.cw_server_list' do
    it 'returns a list of servers' do
      allow_any_instance_of(RubyApiPackCloudways::Connection::CwConnect).to receive(:cloudways_api_connection).and_return('servers' => ['server1'])
      servers = described_class.cw_server_list
      expect(servers).to eq(['server1'])
    end
  end
end
