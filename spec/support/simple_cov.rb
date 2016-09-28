require 'simplecov'

SimpleCov.configure do
  minimum_coverage 100
  refuse_coverage_drop
end

SimpleCov.start 'rails'
