# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_server'

RSpec.describe RubyApiPackCloudways::Api::CwServer do
  let(:cw_connect_instance) { instance_double(RubyApiPackCloudways::Connection::CwConnect) }

  before do
    allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(cw_connect_instance)
  end

  describe '.server_list' do
    it 'returns a list of servers' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return('servers' => ['server1'])
      servers = described_class.server_list
      expect(servers).to eq(['server1'])
    end
  end

  describe '.server_details' do
    it 'returns server details' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return('details' => 'server details')
      details = described_class.server_details('123')
      expect(details).to eq('details' => 'server details')
    end
  end

  describe '.attach_block_storage' do
    it 'attaches block storage to the server' do
      params = { storage_size: 100 }
      allow(cw_connect_instance).to receive(:cloudways_api_post_connection).with(params).and_return('status' => 'attached')
      result = described_class.attach_block_storage('123', params)
      expect(result).to eq('status' => 'attached')
    end
  end

  describe '.clone_server' do
    it 'clones a server' do
      params = { name: 'new_server' }
      allow(cw_connect_instance).to receive(:cloudways_api_post_connection).with(params).and_return('status' => 'cloned')
      result = described_class.clone_server('123', params)
      expect(result).to eq('status' => 'cloned')
    end
  end

  describe '.create_server' do
    it 'creates a new server' do
      params = { server_name: 'my_server' }
      allow(cw_connect_instance).to receive(:cloudways_api_post_connection).with(params).and_return('status' => 'created')
      result = described_class.create_server(params)
      expect(result).to eq('status' => 'created')
    end
  end

  describe '.delete_server' do
    it 'deletes a server' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return('status' => 'deleted')
      result = described_class.delete_server('123')
      expect(result).to eq('status' => 'deleted')
    end
  end

  describe '.disk_usage' do
    it 'returns the disk usage of the server' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return('disk_usage' => '20GB')
      result = described_class.disk_usage('123')
      expect(result).to eq('disk_usage' => '20GB')
    end
  end

  describe '.restart_server' do
    it 'restarts the server' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return('status' => 'restarted')
      result = described_class.restart_server('123')
      expect(result).to eq('status' => 'restarted')
    end
  end

  describe '.scale_block_storage' do
    it 'scales the block storage of the server' do
      params = { new_size: 200 }
      allow(cw_connect_instance).to receive(:cloudways_api_post_connection).with(params).and_return('status' => 'scaled')
      result = described_class.scale_block_storage('123', params)
      expect(result).to eq('status' => 'scaled')
    end
  end

  describe '.scale_volume_size' do
    it 'scales the volume size of the server' do
      params = { new_size: 500 }
      allow(cw_connect_instance).to receive(:cloudways_api_post_connection).with(params).and_return('status' => 'volume_scaled')
      result = described_class.scale_volume_size('123', params)
      expect(result).to eq('status' => 'volume_scaled')
    end
  end

  describe '.start_server' do
    it 'starts the server' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return('status' => 'started')
      result = described_class.start_server('123')
      expect(result).to eq('status' => 'started')
    end
  end

  describe '.stop_server' do
    it 'stops the server' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return('status' => 'stopped')
      result = described_class.stop_server('123')
      expect(result).to eq('status' => 'stopped')
    end
  end

  describe '.update_server_label' do
    it 'updates the server label' do
      params = { label: 'New Server Label' }
      allow(cw_connect_instance).to receive(:cloudways_api_post_connection).with(params).and_return('status' => 'label_updated')
      result = described_class.update_server_label('123', params)
      expect(result).to eq('status' => 'label_updated')
    end
  end

  describe '.upgrade_server' do
    it 'upgrades the server' do
      params = { plan: 'premium' }
      allow(cw_connect_instance).to receive(:cloudways_api_post_connection).with(params).and_return('status' => 'upgraded')
      result = described_class.upgrade_server('123', params)
      expect(result).to eq('status' => 'upgraded')
    end
  end
end
