ENV["EXERCISM_ENV"] = "test"

# This must happen above the env require below
if ENV["CAPTURE_CODE_COVERAGE"]
  require 'simplecov'
  SimpleCov.start
end

gem "minitest"
require "minitest/autorun"
require "minitest/pride"
require "minitest/mock"
require "mocha/minitest"
require "timecop"

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require "tooling_invoker"

# The tests get very noisy if killed threads
# are allowed to report, so shut it up
Thread.report_on_exception = false

module Minitest
  class Test
    def config
      ToolingInvoker.config
    end
  end
end
