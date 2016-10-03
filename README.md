# ruby-restful-api-example-rails-api
**RESTful API sample using `rails api`.**

[![Build Status](https://travis-ci.org/marioluan/ruby-restful-api-example-rails-api.svg?branch=master)](https://travis-ci.org/marioluan/ruby-restful-api-example-rails-api)
[![Dependency Status](https://gemnasium.com/badges/github.com/marioluan/ruby-restful-api-example-rails-api.svg)](https://gemnasium.com/github.com/marioluan/ruby-restful-api-example-rails-api)
[![Code Climate](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api/badges/gpa.svg)](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api)
[![Test Coverage](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api/badges/coverage.svg)](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api/coverage)
[![Inline docs](http://inch-ci.org/github/marioluan/ruby-restful-api-example-rails-api.svg?branch=master)](http://inch-ci.org/github/marioluan/ruby-restful-api-example-rails-api)

***Note: To run the application as a docker container head over [README-docker.md](/README-docker.md).***

***

**Features added to the app:**

- api documentation
  - swagger DSL written inside controllers
  - serving swagger-ui whithin the app

- code quality
  - automatic static analisys of code
  - automatic generation of code coverage reports

- database sample data
  - rake task to load data [from factories] into database

## pre-requisites:
- ruby (v2.3.1)
- bundler (v1.12.5)

## running
### 1. download the dependencies
```bash
$ bundle install --path=vendor
```

### 2. run pending migrations
```bash
$ bundle exec rails db:migrate
```

### 3. populate the database with random data
```bash
$ bundle exec rails db:factories:load
```

### 4. load swagger-ui
```bash
$ git submodule init
$ git submodule update
```

### 5. generate the api documentation
```bash
$ bundle exec rake swagger:docs
```

### 6. start the app
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
