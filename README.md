# ruby-restful-api-example-rails-api
Example of building an API using Rails API.

pre-requisites:
- ruby (v2.3.1)
- bundler (v1.12.5)

## running
### download the dependencies
```bash
$ bundle install
```

### start the app
```bash
$ bundle exec rails server
```

### list available routes to interact with the API
```bash
$ bundle exec rake routes
```

## unit.tests
Run unit tests.
```bash
bundle exec rspec
```

## code.coverage:
Code coverage report is automatically generated to `coverage/index.html` when unit tests are run.

**Example:**
```
$ bundle exec rspec
Randomized with seed 65448

Developer
  should validate that the length of :name is at least 2
  should validate that :name cannot be empty/falsy
  should validate that :age looks like an integer

[...]

Finished in 1.29 seconds (files took 1.11 seconds to load)
100 examples, 0 failures

Randomized with seed 65448

Coverage report generated for RSpec to [...]/coverage. 40 / 40 LOC (100.0%) covered.
```

## code.style:
Run the static code analyzer, based on the community Ruby style guide.
```bash
$ bundle exec rubocop -S
```

## environment variables
- `RAILS_ENV`: used by the application to load configuration based on the environment.
- `RAILS_LOG_TO_STDOUT`: when set, logs to stdout instead of writing to file.
