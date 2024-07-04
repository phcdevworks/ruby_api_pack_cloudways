# frozen_string_literal: true

require 'spec_helper'
require 'ruby_api_pack_cloudways'

RSpec.describe RubyApiPackCloudways do
  it 'has a version number' do
    expect(RubyApiPackCloudways::VERSION).not_to be_nil
  end

  it 'initializes the CwClient class' do
    expect { RubyApiPackCloudways::CwClient.new }.not_to raise_error
  end
end
