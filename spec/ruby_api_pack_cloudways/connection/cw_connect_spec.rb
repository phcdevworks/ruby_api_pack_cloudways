# frozen_string_literal: true

RSpec.describe RubyApiPackCloudways::Connection::CwConnect do
  let(:connection) { described_class.new('https://api.cloudways.com/api/v1', '/some_path') }
  let(:token_instance) { instance_double(RubyApiPackCloudways::Connection::CwToken, cw_api_token: 'fake_token') }
  let(:http_response) { instance_double(HTTParty::Response, code: 200, body: '{"data":"value"}') }
  let(:post_params) { { key: 'value' } }

  before do
    allow(RubyApiPackCloudways::Connection::CwToken).to receive(:new).and_return(token_instance)
    allow(HTTParty).to receive_messages(get: http_response, post: http_response)
  end

  describe '#cloudways_api_connection' do
    it 'creates an HTTParty GET connection' do
      connection.cloudways_api_connection

      expect(HTTParty).to have_received(:get).with(
        'https://api.cloudways.com/api/v1/some_path',
        headers: { 'Authorization' => 'Bearer fake_token' },
        ssl_version: :TLSv1_2,
        debug_output: $stdout
      )
    end

    it 'returns a successful response' do
      response = connection.cloudways_api_connection
      expect(response['data']).to eq('value')
    end

    context 'when the response code is not 200' do
      let(:error_response) { instance_double(HTTParty::Response, code: 500, body: '{"error":"Server error"}') }

      before do
        allow(HTTParty).to receive(:get).and_return(error_response)
      end

      it 'raises an error with the response code' do
        expect { connection.cloudways_api_connection }.to raise_error('Error: Received status 500')
      end
    end

    context 'when parsing the response fails' do
      let(:faulty_response) { instance_double(HTTParty::Response, code: 200, body: 'invalid_json') }

      before do
        allow(HTTParty).to receive(:get).and_return(faulty_response)
        allow(Oj).to receive(:load).and_raise(Oj::ParseError.new('Unexpected character'))
      end

      it 'raises a parsing error' do
        expect { connection.cloudways_api_connection }.to raise_error(/Error parsing response: Unexpected character/)
      end
    end
  end

  describe '#cloudways_api_post_connection' do
    it 'creates an HTTParty POST connection with JSON body' do
      connection.cloudways_api_post_connection(post_params)

      expect(HTTParty).to have_received(:post).with(
        'https://api.cloudways.com/api/v1/some_path',
        headers: {
          'Authorization' => 'Bearer fake_token',
          'Content-Type' => 'application/json'
        },
        body: post_params.to_json,
        ssl_version: :TLSv1_2,
        debug_output: $stdout
      )
    end

    it 'returns a successful response for POST request' do
      response = connection.cloudways_api_post_connection(post_params)
      expect(response['data']).to eq('value')
    end

    context 'when the POST response code is not 200' do
      let(:error_response) { instance_double(HTTParty::Response, code: 500, body: '{"error":"Server error"}') }

      before do
        allow(HTTParty).to receive(:post).and_return(error_response)
      end

      it 'raises an error with the response code for POST request' do
        expect { connection.cloudways_api_post_connection(post_params) }.to raise_error('Error: Received status 500')
      end
    end

    context 'when parsing the POST response fails' do
      let(:faulty_response) { instance_double(HTTParty::Response, code: 200, body: 'invalid_json') }

      before do
        allow(HTTParty).to receive(:post).and_return(faulty_response)
        allow(Oj).to receive(:load).and_raise(Oj::ParseError.new('Unexpected character'))
      end

      it 'raises a parsing error for POST request' do
        expect do
          connection.cloudways_api_post_connection(post_params)
        end.to raise_error(/Error parsing response: Unexpected character/)
      end
    end
  end
end
