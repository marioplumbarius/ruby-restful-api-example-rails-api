Kaminari.configure do |config|
  # TODO: read from environment variables
  config.default_per_page = 10
  config.max_per_page = 20
  config.page_method_name = :page
  config.param_name = :page
end
