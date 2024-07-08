# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/connection/cw_token'

RSpec.describe RubyApiPackCloudways::Connection::CwToken do
  let(:token) { described_class.new }
  let(:response) { instance_double(HTTParty::Response, body: '{"access_token":"fake_token"}') }

  before do
    RubyApiPackCloudways.configure do |config|
      config.api_url = 'https://api.cloudways.com/api/v1'
      config.api_path_token = '/oauth/access_token'
      config.api_email = 'test@example.com'
      config.api_key = 'test_key'
    end
    allow(HTTParty).to receive(:post).and_return(response)
  end

  describe '#cw_api_token' do
    it 'returns an access token' do
      expect(token.cw_api_token).to eq('fake_token')
    end

    it 'calls the correct endpoint' do
      token.cw_api_token
      expect_httparty_post_with_correct_params
    end
  end

  def expect_httparty_post_with_correct_params
    expect(HTTParty).to have_received(:post).with(
      'https://api.cloudways.com/api/v1/oauth/access_token',
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded' },
      body: { email: 'test@example.com', api_key: 'test_key' }
    )
  end
end
