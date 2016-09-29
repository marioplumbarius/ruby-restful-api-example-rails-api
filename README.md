# ruby-restful-api-example-rails-api
RESTful API sample using `rails api`.

[![Build Status](https://travis-ci.org/marioluan/ruby-restful-api-example-rails-api.svg?branch=master)](https://travis-ci.org/marioluan/ruby-restful-api-example-rails-api)
[![Dependency Status](https://gemnasium.com/badges/github.com/marioluan/ruby-restful-api-example-rails-api.svg)](https://gemnasium.com/github.com/marioluan/ruby-restful-api-example-rails-api)


## pre-requisites:
- ruby (v2.3.1)
- bundler (v1.12.5)

## running
### download the dependencies
```bash
$ bundle install --path=vendor
```

### run pending migrations
```bash
$ bundle exec rails db:migrate
```

### populate the database with random data
```bash
$ bundle exec rails db:factories:load
```

### load swagger-ui
```bash
$ git submodule init
$ git submodule update
```

### generate the api documentation
```bash
$ bundle exec rake swagger:docs
```

### start the app
```bash
$ bundle exec rails server
```

And head over to [http://localhost:3000/docs](http://localhost:3000/docs) to
interact with the api.

## useful documentation:
- [CHANGELOG.md](./CHANGELOG.md)
- [CONFIG.md](./CONFIG.md)
- [CONTRIBUTING.md](./CONTRIBUTING.md)
- [MONITORING.md](./MONITORING.md)
