# frozen_string_literal: true

RSpec.describe 'README version sync' do
  it 'matches the gem VERSION constant' do
    readme = File.read(File.join(__dir__, '..', 'README.md'))
    match = readme.match(/\|\s*Current version\/status\s*\|\s*([^\s|]+)\s*\|/i)

    expect(match).not_to be_nil, 'README.md is missing the "Current version/status" row in the Repository Snapshot table.'
    expect(match[1]).to eq(RubyApiPackCloudways::VERSION)
  end
end
