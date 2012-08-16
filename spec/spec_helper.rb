require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/mock'
require 'webmock/minitest'
require 'mocha'
# require 'capybara/dsl'
# require 'capybara/rails'

# Change fixtures location to spec folder
ActiveSupport::TestCase.fixture_path = File.dirname(__FILE__) + "/fixtures/"

# Require ruby files in support dir.
Dir[File.expand_path('spec/support/*.rb')].each { |file| require file }

# Define default test reporting style
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

# Database cleaner.
DatabaseCleaner.strategy = :truncation

ActiveSupport::Deprecation.silenced = true

class ActiveSupport::TestCase
  # You'll  have to declare fixtures explicitly in integration tests
  fixtures :all
end

class MiniTest::Spec
  class << self
    alias :context :describe
  end

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end