$:.unshift File.dirname(__FILE__) + '/../library'

require 'rar'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Returns the path to the directory with the fixtures.
  def fixture_path
    File.join File.dirname(__FILE__), 'fixtures'
  end
end
