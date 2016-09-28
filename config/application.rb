require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # disables serving static files from the /public directory by default
    config.public_file_server.enabled = false

    # disables caching
    config.action_controller.perform_caching = false
    config.cache_store = :null_store

    # Full error reports are disabled.
    config.consider_all_requests_local = false

    # List of middlewares that we don't need
    # useful documentation on middlewares can be found at:
    # http://guides.rubyonrails.org/rails_on_rack.html#internal-middleware-stack
    config.middleware.delete ::Rack::Sendfile
    config.middleware.delete ::ActionDispatch::Static
    config.middleware.delete ::ActionDispatch::RemoteIp
    config.middleware.delete ::Rack::Head
    config.middleware.delete ::Rack::ConditionalGet
    config.middleware.delete ::Rack::ETag
  end
end
