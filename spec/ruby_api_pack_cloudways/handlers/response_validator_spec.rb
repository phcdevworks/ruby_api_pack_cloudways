# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways/handlers/response_validator'

RSpec.describe RubyApiPackCloudways::Handlers::ResponseValidator do
  # Create a dummy class to include the module for testing
  let(:dummy_class) do
    Class.new do
      include RubyApiPackCloudways::Handlers::ResponseValidator
    end.new
  end

  let(:valid_response) { { 'key' => [{ 'name' => 'Example' }] } }
  let(:missing_key_response) { { 'other_key' => [] } }
  let(:invalid_response_format) { 'Invalid response' }
  let(:non_array_key_response) { { 'key' => 'Not an array' } }

  describe '#validate_response' do
    context 'with a valid response' do
      it 'returns the expected array' do
        result = dummy_class.validate_response(valid_response, 'key')
        expect(result).to eq([{ 'name' => 'Example' }])
      end
    end

    context 'when the response is not a hash' do
      it 'raises an error for invalid response format' do
        expect { dummy_class.validate_response(invalid_response_format, 'key') }
          .to raise_error(/Unexpected response format: "Invalid response"/)
      end
    end

    context 'when the key is missing in the response' do
      it 'raises an error for missing key' do
        expect { dummy_class.validate_response(missing_key_response, 'key') }
          .to raise_error(/Unexpected response format: {"other_key"=>\[\]}/)
      end
    end

    context 'when the key value is not an array' do
      it 'raises an error for non-array value' do
        expect { dummy_class.validate_response(non_array_key_response, 'key') }
          .to raise_error(/Expected 'key' to be an Array, got String: "Not an array"/)
      end
    end
  end

  describe '#log_error' do
    context 'when Rails is defined' do
      it 'logs the error using Rails.logger' do
        stub_const('Rails', double('Rails', logger: double('Logger', error: nil)))
        expect(Rails.logger).to receive(:error).with('[ERROR] Test error')
        dummy_class.send(:log_error, '[ERROR] Test error')
      end
    end

    context 'when Rails is not defined' do
      it 'logs the error using puts' do
        allow(dummy_class).to receive(:puts)
        dummy_class.send(:log_error, '[ERROR] Test error')
        expect(dummy_class).to have_received(:puts).with('[ERROR] [ERROR] Test error')
      end
    end
  end
end
