require 'simplecov'

SimpleCov.configure do
  minimum_coverage 100
  refuse_coverage_drop

  add_filter 'vendor'
end

SimpleCov.start 'rails'
