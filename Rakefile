# frozen_string_literal: true

require 'rake'
require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new do |task|
  task.patterns = ['lib/**/*.rb', 'spec/**/*.rb', '*.gemspec', 'Rakefile']
end

RSpec::Core::RakeTask.new(:spec)

task default: %i[rubocop spec]
