# ruby-restful-api-example-rails-api
Example of building an API using Rails API.

**Middlewares enabled by default:**
- ActionDispatch::Executor
- ActiveSupport::Cache::Strategy::LocalCache::Middleware
- Rack::Runtime
- ActionDispatch::RequestId
- Rails::Rack::Logger
- ActionDispatch::ShowExceptions
- ActionDispatch::DebugExceptions
- ActionDispatch::Reloader
- ActionDispatch::Callbacks
- ActiveRecord::Migration::CheckPending

### Useful generators
**factory generator**
```bash
$ rails generate factory_girl:model ModelName field:type
```
