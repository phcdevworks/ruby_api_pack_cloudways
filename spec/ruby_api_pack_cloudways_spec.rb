# frozen_string_literal: true

require 'spec_helper'

# PHCDEVONE - RSpec describe block for the RubyApiPackCloudways module
RSpec.describe RubyApiPackCloudways do
  # PHCDEVONE - It block to test that the version number is not nil
  it 'has a version number' do
    expect(RubyApiPackCloudways::VERSION).not_to be_nil
  end
end
