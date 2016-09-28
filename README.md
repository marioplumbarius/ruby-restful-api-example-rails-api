# ruby-restful-api-example-rails-api
Example of building an API using Rails API.

### Useful generators
**factory generator**
```bash
$ rails generate factory_girl:model ModelName field:type
```

### code.style:
```bash
$ bundle exec rubocop -S
```

### code.coverage:
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
