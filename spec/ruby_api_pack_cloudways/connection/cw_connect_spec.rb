# frozen_string_literal: true

RSpec.describe RubyApiPackCloudways::Connection::CwConnect do
  subject(:connection) { described_class.new('https://api.cloudways.com/api/v1', '/some_path') }

  let(:token_instance) { instance_double(RubyApiPackCloudways::Connection::CwToken, cw_api_token: 'fake_token') }
  let(:http_response) do
    instance_double(
      HTTParty::Response,
      code: 200,
      body: '{"data":"value"}',
      headers: { 'content-type' => 'application/json' }
    )
  end
  let(:post_params) { { key: 'value' } }

  before do
    allow(RubyApiPackCloudways::Connection::CwToken).to receive(:new).and_return(token_instance)
    allow(HTTParty).to receive_messages(get: http_response, post: http_response)
  end

  it 'is a RubyApiPackCore::Connection::Base subclass' do
    expect(described_class).to be < RubyApiPackCore::Connection::Base
  end

  describe '#api_get' do
    it 'sends a Cloudways OAuth bearer token as the Authorization header' do
      connection.api_get

      expect(HTTParty).to have_received(:get).with(
        'https://api.cloudways.com/api/v1/some_path',
        hash_including(headers: { 'Authorization' => 'Bearer fake_token' })
      )
    end

    it 'returns the parsed JSON body, inherited from RubyApiPackCore::Connection::Base' do
      response = connection.api_get
      expect(response['data']).to eq('value')
    end

    context 'when rate limit is exceeded' do
      let(:rate_limit_error) { RuntimeError.new('Rate limit exceeded') }

      before do
        allow(connection).to receive(:sleep) # rubocop:disable RSpec/SubjectStub -- neutralize the real 60s cool-down

        attempts = 0
        allow(HTTParty).to receive(:get).and_wrap_original do |_original_method, *_args|
          attempts += 1
          raise rate_limit_error if attempts == 1

          instance_double(
            HTTParty::Response,
            code: 200,
            body: '{"data":"value"}',
            headers: { 'content-type' => 'application/json' }
          )
        end
      end

      it 'retries after a rate limit error and succeeds' do
        response = connection.api_get
        expect(response['data']).to eq('value')
        expect(HTTParty).to have_received(:get).twice # Confirms retry occurred
      end
    end

    context 'when an unexpected runtime error occurs' do
      before do
        allow(HTTParty).to receive(:get).and_raise(RuntimeError, 'Unexpected error')
      end

      it 'raises the unexpected runtime error without retrying' do
        expect { connection.api_get }.to raise_error(RuntimeError, 'Unexpected error')
      end
    end
  end

  describe '#api_post' do
    it 'sends a Cloudways OAuth bearer token as the Authorization header' do
      connection.api_post(post_params)

      expect(HTTParty).to have_received(:post).with(
        'https://api.cloudways.com/api/v1/some_path',
        hash_including(
          headers: { 'Authorization' => 'Bearer fake_token', 'Content-Type' => 'application/json' },
          body: post_params.to_json
        )
      )
    end
  end

  describe 'backward-compatible aliases' do
    it 'aliases cloudways_api_connection to #api_get' do
      expect(connection.cloudways_api_connection['data']).to eq('value')
      expect(HTTParty).to have_received(:get)
    end

    it 'aliases cloudways_api_post_connection to #api_post' do
      expect(connection.cloudways_api_post_connection(post_params)['data']).to eq('value')
      expect(HTTParty).to have_received(:post)
    end
  end
end
