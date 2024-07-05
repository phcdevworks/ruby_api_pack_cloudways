# frozen_string_literal: true

require 'bundler/setup'
require 'ruby_api_pack_cloudways'

# PHCDEVONE - RSpec configuration block
RSpec.configure do |config|
  # PHCDEVONE - Configure RSpec expectations
  config.expect_with :rspec do |expectations|
    # PHCDEVONE - Include chain clauses in custom matcher descriptions
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # PHCDEVONE - Configure RSpec mocks
  config.mock_with :rspec do |mocks|
    # PHCDEVONE - Verify partial doubles
    mocks.verify_partial_doubles = true
  end

  # PHCDEVONE - Apply shared context metadata behavior to host groups
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # PHCDEVONE - Disable RSpec monkey patching
  config.disable_monkey_patching!
  # PHCDEVONE - Enable warnings
  config.warnings = true

  # PHCDEVONE - Set default formatter to 'doc' if only one file is run
  config.default_formatter = 'doc' if config.files_to_run.one?

  # PHCDEVONE - Run specs in random order
  config.order = :random

  # PHCDEVONE - Seed global randomization
  Kernel.srand config.seed
end
