# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/api/cw_lists'

RSpec.describe RubyApiPackCloudways::Api::CwLists do
  let(:cw_connect_instance) { instance_double(RubyApiPackCloudways::Connection::CwConnect) }

  before do
    allow(RubyApiPackCloudways::Connection::CwConnect).to receive(:new).and_return(cw_connect_instance)
  end

  describe '.provider_list' do
    it 'returns a list of providers' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'providers' => ['provider1']
      )

      providers = described_class.provider_list
      expect(providers).to eq(['provider1'])
    end
  end

  describe '.server_size_list' do
    it 'returns a list of server sizes' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'sizes' => ['size1']
      )

      sizes = described_class.server_size_list
      expect(sizes).to eq(['size1'])
    end
  end

  describe '.app_list' do
    it 'returns a list of apps' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'apps' => ['app1']
      )

      apps = described_class.app_list
      expect(apps).to eq(['app1'])
    end
  end

  describe '.package_list' do
    it 'returns a list of packages' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'packages' => ['package1']
      )

      packages = described_class.package_list
      expect(packages).to eq(['package1'])
    end
  end

  describe '.backup_frequency_list' do
    it 'returns a list of backup frequencies' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'frequencies' => %w[daily weekly]
      )

      frequencies = described_class.backup_frequency_list
      expect(frequencies).to eq(%w[daily weekly])
    end
  end

  describe '.country_list' do
    it 'returns a list of countries' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'countries' => %w[Country1 Country2]
      )

      countries = described_class.country_list
      expect(countries).to eq(%w[Country1 Country2])
    end
  end

  describe '.monitor_duration_list' do
    it 'returns a list of monitor durations' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'durations' => %w[5min 15min]
      )

      durations = described_class.monitor_duration_list
      expect(durations).to eq(%w[5min 15min])
    end
  end

  describe '.monitor_target_list' do
    it 'returns a list of monitor targets' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'targets' => %w[target1 target2]
      )

      targets = described_class.monitor_target_list
      expect(targets).to eq(%w[target1 target2])
    end
  end

  describe '.region_list' do
    it 'returns a list of regions' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'regions' => %w[region1 region2]
      )

      regions = described_class.region_list
      expect(regions).to eq(%w[region1 region2])
    end
  end

  describe '.setting_list' do
    it 'returns a list of settings' do
      allow(cw_connect_instance).to receive(:cloudways_api_connection).and_return(
        'settings' => %w[setting1 setting2]
      )

      settings = described_class.setting_list
      expect(settings).to eq(%w[setting1 setting2])
    end
  end
end
