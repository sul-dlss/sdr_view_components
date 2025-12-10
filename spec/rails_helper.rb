# frozen_string_literal: true

# spec/rails_helper.rb
ENV['RAILS_ENV'] ||= 'test'

# Load the dummy app
require_relative 'dummy/config/environment'

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'

# Optional: Capybara for component/system-like tests
require 'capybara/rspec'
require 'view_component/test_helpers'

# Load support files
Dir[File.join(__dir__, 'support/**/*.rb')].each { |f| require f }

# Use Nokogiri's HTML5 parser
Capybara.use_html5_parsing = true

RSpec.configure do |config|
  config.include ViewComponent::TestHelpers, type: :component
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
