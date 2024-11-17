# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_lists'

RSpec.describe RubyApiPackCloudways::Api::CwLists do
  let(:cw_connect_instance) { instance_double(RubyApiPackCloudways::Connection::CwConnect) }

  before do
    allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(cw_connect_instance)
  end

  shared_examples 'a list fetcher' do |method, endpoint_key, expected_result|
    it "returns a list of #{endpoint_key}" do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        endpoint_key => expected_result
      )

      result = described_class.public_send(method)
      expect(result).to eq(expected_result)
    end
  end

  describe '.provider_list' do
    it_behaves_like 'a list fetcher', :provider_list, 'providers', ['provider1']
  end

  describe '.server_size_list' do
    it_behaves_like 'a list fetcher', :server_size_list, 'sizes', ['size1']
  end

  describe '.app_list' do
    it_behaves_like 'a list fetcher', :app_list, 'apps', ['app1']
  end

  describe '.package_list' do
    it_behaves_like 'a list fetcher', :package_list, 'packages', ['package1']
  end

  describe '.backup_frequency_list' do
    it_behaves_like 'a list fetcher', :backup_frequency_list, 'frequencies', %w[daily weekly]
  end

  describe '.country_list' do
    it_behaves_like 'a list fetcher', :country_list, 'countries', %w[Country1 Country2]
  end

  describe '.monitor_duration_list' do
    it_behaves_like 'a list fetcher', :monitor_duration_list, 'durations', %w[5min 15min]
  end

  describe '.monitor_target_list' do
    it_behaves_like 'a list fetcher', :monitor_target_list, 'targets', %w[target1 target2]
  end

  describe '.region_list' do
    it_behaves_like 'a list fetcher', :region_list, 'regions', %w[region1 region2]
  end

  describe '.setting_list' do
    it_behaves_like 'a list fetcher', :setting_list, 'settings', %w[setting1 setting2]
  end
end
