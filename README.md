# PHCDevworks Accounts Stytch

![Forks](https://img.shields.io/github/forks/phcdevworks/ruby_api_pack_cloudways.svg?style=social)
![Stars](https://img.shields.io/github/stars/phcdevworks/ruby_api_pack_cloudways.svg?style=social)
[![Tweet](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Fgithub.com%2Fphcdevworks%2Fruby_api_pack_cloudways)](https://twitter.com/intent/tweet?text=Check%20out%20this%20authentication%20gem%20for%20Rails%20integrating%20with%20Stytch!%20https://github.com/phcdevworks/ruby_api_pack_cloudways)

## Overview

![Build Status](https://github.com/phcdevworks/ruby_api_pack_cloudways/actions/workflows/test.yml/badge.svg)
![Gem Version](https://img.shields.io/gem/v/ruby_api_pack_cloudways.svg)
![Last Commit](https://img.shields.io/github/last-commit/phcdevworks/ruby_api_pack_cloudways.svg)
![Issues](https://img.shields.io/github/issues/phcdevworks/ruby_api_pack_cloudways.svg)
![Dependabot Status](https://img.shields.io/badge/Dependabot-enabled-brightgreen.svg?logo=dependabot)
[![CodeQL](https://github.com/phcdevworks/ruby_api_pack_cloudways/actions/workflows/github-code-scanning/codeql/badge.svg)](https://github.com/phcdevworks/ruby_api_pack_cloudways/actions/workflows/github-code-scanning/codeql)
![Security Policy](https://img.shields.io/badge/Security-Policy-brightgreen.svg?logo=github)

RubyApiPackCloudways is a Ruby gem that provides an easy interface for interacting with the Cloudways API. It includes functionality for fetching information about Cloudways providers, server sizes, apps, and packages, as well as managing server connections and authentication tokens.

## Key Features:

- **Provider List**: Fetch the list of available Cloudways providers.
- **Server Sizes**: Retrieve details about available server sizes supported by Cloudways.
- **App List**: Access a list of Cloudways applications.
- **Package List**: Fetch the available packages on Cloudways.
- **Token-Based Authentication**: Secure access to Cloudways API using OAuth tokens.

## Usage

### 1. Set up Cloudways API credentials

You will need to configure your Cloudways API credentials in your Ruby environment. Here’s how you can do it:

1. Open your configuration block in the initializer or main application file:

```ruby
RubyApiPackCloudways.configure do |config|
  config.api_url = 'https://api.cloudways.com/api/v1'
  config.api_path_token = '/oauth/access_token'
  config.api_email = '<your_cloudways_email>'
  config.api_key = '<your_cloudways_api_key>'
end
```

2. Save and restart your application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "ruby_api_pack_cloudways"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ruby_api_pack_cloudways
```

## Contributing

[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
[![contributors](https://contributors-img.web.app/image?repo=phcdevworks/ruby_api_pack_cloudways)](https://github.com/phcdevworks/ruby_api_pack_cloudways/graphs/contributors)


## License

![License](https://img.shields.io/github/license/phcdevworks/ruby_api_pack_cloudways.svg)
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
