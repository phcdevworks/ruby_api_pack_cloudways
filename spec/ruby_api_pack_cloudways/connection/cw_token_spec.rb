# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/connection/cw_token'
require 'ruby_api_pack_cloudways/constants'

RSpec.describe RubyApiPackCloudways::Connection::CwToken do
  include RubyApiPackCloudways::Constants

  let(:cw_api_url_base) { RubyApiPackCloudways::Constants::CW_API_URL }
  let(:cw_url_path_auth) { RubyApiPackCloudways::Constants::CW_API_PATH_TOKEN }
  let(:cw_user_email) { RubyApiPackCloudways::Constants::CW_API_EMAIL }
  let(:cw_user_key) { RubyApiPackCloudways::Constants::CW_API_KEY }
  let(:mock_faraday) { class_double(Faraday) }
  let(:mock_connection) { instance_double(Faraday::Connection) }

  subject(:token) { described_class.new(cw_api_url_base, cw_url_path_auth, cw_user_email, cw_user_key, mock_faraday) }

  describe '#cw_api_token_connection' do
    before do
      allow(mock_faraday).to receive(:new).and_return(mock_connection)
    end

    it 'creates a Faraday connection' do
      token.cw_api_token_connection

      expect(mock_faraday).to have_received(:new).with(url: "#{cw_api_url_base}#{cw_url_path_auth}")
    end

    it 'returns the Faraday connection instance' do
      connection = token.cw_api_token_connection

      expect(connection).to eq(mock_connection)
    end
  end

  describe '#cw_api_token' do
    it 'returns an access token' do
      allow(mock_faraday).to receive(:new).and_return(mock_connection)
      allow(mock_connection).to receive(:post).and_return(
        instance_double(Faraday::Response, body: '{"access_token":"fake_token"}')
      )

      token_result = token.cw_api_token

      expect(token_result).to eq('fake_token')
    end
  end
end
