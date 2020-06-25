# Make sure specs run with the definitions from test.rb
ENV['ROBOT_ENVIRONMENT'] = 'test'

require 'webmock/rspec'
require 'simplecov'
require 'coveralls'
require 'byebug'
Coveralls.wear!

# Setup basic storage roots for tests
# Moab::Config.storage_roots = [File.join(File.dirname(__FILE__), "fixtures/deposit")]

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter 'spec'
  add_filter 'config'
end

require File.join(File.dirname(__FILE__), '..', 'config/boot')

Retries.sleep_enabled = false # skip delays during testing
