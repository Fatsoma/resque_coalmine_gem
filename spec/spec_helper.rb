$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require "bundler/setup"
require 'resque_coalmine'

RSpec.configure do |config|
  config.mock_with :mocha
end