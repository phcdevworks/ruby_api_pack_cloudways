# frozen_string_literal: true

RSpec.describe RubyApiPackCloudways::Connection::CwConnect do
  let(:connection) { described_class.new('https://api.cloudways.com/api/v1', '/some_path') }
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
      let(:error_response) do
        instance_double(
          HTTParty::Response,
          code: 500,
          body: '{"error":"Server error"}',
          headers: { 'content-type' => 'application/json' }
        )
      end

      before do
        allow(HTTParty).to receive(:get).and_return(error_response)
      end

      it 'raises an error with the response code' do
        expect { connection.cloudways_api_connection }.to raise_error('Error: Received status 500')
      end
    end

    context 'when parsing the response fails' do
      let(:faulty_response) do
        instance_double(
          HTTParty::Response,
          code: 200,
          body: 'invalid_json',
          headers: { 'content-type' => 'application/json' }
        )
      end

      before do
        allow(HTTParty).to receive(:get).and_return(faulty_response)
        allow(Oj).to receive(:load).and_raise(Oj::ParseError.new('Unexpected character'))
      end

      it 'raises a parsing error' do
        expect { connection.cloudways_api_connection }.to raise_error(/Error parsing response: Unexpected character/)
      end
    end

    context 'when rate limit is exceeded' do
      let(:rate_limit_error) { RuntimeError.new('Rate limit exceeded') }

      before do
        attempts = 0
        allow(HTTParty).to receive(:get).and_wrap_original do |original_method, *args|
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
        response = connection.cloudways_api_connection
        expect(response['data']).to eq('value')
        expect(HTTParty).to have_received(:get).twice # Confirms retry occurred
      end
    end

    context 'when an unexpected runtime error occurs' do
      before do
        allow(HTTParty).to receive(:get).and_raise(RuntimeError, 'Unexpected error')
      end

      it 'raises the unexpected runtime error' do
        expect { connection.cloudways_api_connection }.to raise_error(RuntimeError, 'Unexpected error')
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
      let(:error_response) do
        instance_double(
          HTTParty::Response,
          code: 500,
          body: '{"error":"Server error"}',
          headers: { 'content-type' => 'application/json' }
        )
      end

      before do
        allow(HTTParty).to receive(:post).and_return(error_response)
      end

      it 'raises an error with the response code for POST request' do
        expect { connection.cloudways_api_post_connection(post_params) }.to raise_error('Error: Received status 500')
      end
    end

    context 'when parsing the POST response fails' do
      let(:faulty_response) do
        instance_double(
          HTTParty::Response,
          code: 200,
          body: 'invalid_json',
          headers: { 'content-type' => 'application/json' }
        )
      end

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

  describe '#parse_response' do
    let(:valid_response) do
      instance_double(
        HTTParty::Response,
        body: '{"key":"value"}',
        headers: { 'content-type' => 'application/json' }
      )
    end

    let(:invalid_response_missing_content_type) do
      instance_double(
        HTTParty::Response,
        body: '{"key":"value"}',
        headers: nil
      )
    end

    let(:invalid_response_wrong_content_type) do
      instance_double(
        HTTParty::Response,
        body: '{"key":"value"}',
        headers: { 'content-type' => 'text/html' }
      )
    end

    let(:invalid_json_response) do
      instance_double(
        HTTParty::Response,
        body: 'invalid_json',
        headers: { 'content-type' => 'application/json' }
      )
    end

    it 'parses the response body successfully when content-type is application/json' do
      result = connection.send(:parse_response, valid_response)
      expect(result).to eq({ 'key' => 'value' })
    end

    it 'raises an error when content-type is missing' do
      invalid_response_missing_content_type = instance_double(
        HTTParty::Response,
        body: '{"key":"value"}',
        headers: nil
      )
      expect do
        connection.send(:parse_response, invalid_response_missing_content_type)
      end.to raise_error(/Unexpected response/)
    end

    it 'raises an error when content-type does not include application/json' do
      expect do
        connection.send(:parse_response, invalid_response_wrong_content_type)
      end.to raise_error(/Unexpected response/)
    end

    it 'raises a parsing error when Oj fails to parse the response body' do
      allow(Oj).to receive(:load).and_raise(Oj::ParseError, 'Unexpected character')
      expect do
        connection.send(:parse_response, invalid_json_response)
      end.to raise_error(/Error parsing response: Unexpected character/)
    end
  end
end
