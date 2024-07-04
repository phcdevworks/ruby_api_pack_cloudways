# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_api_pack_cloudways/version'

Gem::Specification.new do |spec|
  spec.name        = 'ruby_api_pack_cloudways'
  spec.version     = RubyApiPackCloudways::VERSION
  spec.authors     = ['PHCDevworks', 'Brad Potts']
  spec.email       = ['info@phcdevworks.com', 'brad.potts@phcdevworks.com']
  spec.homepage    = 'https://phcdevworks.com/'
  spec.summary     = 'API Pack for Cloudways'
  spec.description = 'Ruby API wrapper to use with Cloudways API.'
  spec.license     = 'MIT'

  # Specify the required Ruby version
  spec.required_ruby_version = '>= 2.7.0'

  # Gem Meta Data
  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/phcdevworks/ruby_api_pack_cloudways/'
  spec.metadata['changelog_uri'] = 'https://github.com/phcdevworks/ruby_api_pack_cloudways/releases'

  spec.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  spec.require_paths = ['lib']

  # Main Dependencies
  spec.add_dependency 'bundler', '~> 2.3'
  spec.add_dependency 'faraday', '~> 2.5'
  spec.add_dependency 'httparty', '~> 0.20.0'
  spec.add_dependency 'oj', '~> 3.13'
  spec.add_dependency 'rake', '~> 13.0'
end
