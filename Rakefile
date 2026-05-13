# frozen_string_literal: true

require 'bundler/setup'

APP_RAKEFILE = File.expand_path('spec/dummy/Rakefile', __dir__)
load 'rails/tasks/engine.rake'

require 'bundler/gem_tasks'
# require 'rspec/core/rake_task'
# require 'rubocop/rake_task'

# RuboCop::RakeTask.new
# RSpec::Core::RakeTask.new(:spec)

# task default: %i[rubocop spec]

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  desc 'Run erblint against ERB files'
  task erblint: :environment do
    puts 'Running ERB linter...'
    sh('bin/erb_lint --lint-all --format compact')
  end

  # desc 'Run linter against JS files'
  # task eslint: :environment do
  #   puts 'Running JS linter...'
  #   sh('yarn run lint')
  # end

  # desc 'Run linter against style files'
  # task stylelint: :environment do
  #   puts 'Running style linter...'
  #   sh('yarn run stylelint')
  # end

  desc 'Run herb against ERB files'
  task herb: :environment do
    puts 'Running ERB linter...'
    sh('bin/herb analyze app --no-timing')
  end

  desc 'Run all configured linters'
  task lint: %i[rubocop erblint herb]

  # clear the default task injected by rspec
  task(:default).clear

  task default: %i[lint spec] # rubocop:disable RSpec/DuplicateTask
rescue LoadError
  # should only be here when gem group development and test aren't installed
end
