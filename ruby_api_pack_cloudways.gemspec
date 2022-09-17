lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_api_pack_cloudways/version"

Gem::Specification.new do |spec|

    spec.name        = "ruby_api_pack_cloudways"
    spec.version     = RubyApiPackCloudways::VERSION
    spec.authors     = ["PHCDevworks"]
    spec.email       = ["imfo@phcdevworks.com"]
    spec.homepage    = "https://phcdevworks.com/"
    spec.summary     = "API Pack for Cloudways"
    spec.description = "Ruby API wrapper to use with Cloudways API. Can be used alone or part of the larger PHCDevworks Ruby API Pack."
    spec.license     = "MIT"

    # Gem Meta Data
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/phcdevworks/ruby_api_pack_cloudways/"
    spec.metadata["changelog_uri"] = "https://github.com/phcdevworks/ruby_api_pack_cloudways/releases"

    spec.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
    spec.require_paths = ["lib"]

    # Main Dependencues
    spec.add_dependency "bundler", "~> 2.3"
    spec.add_dependency "rake", "~> 13.0"
    
    # API Dependencies
    spec.add_dependency "oj", "~> 3.13"
    spec.add_dependency "httparty", "~> 0.20.0"
    spec.add_dependency "faraday", "~> 2.5"

    # Testing Dependencies
    spec.add_development_dependency "rspec", "~> 3.10"

end
