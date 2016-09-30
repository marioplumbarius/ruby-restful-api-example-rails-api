# ruby-restful-api-example-rails-api
**RESTful API sample using `rails api`.**

[![Build Status](https://travis-ci.org/marioluan/ruby-restful-api-example-rails-api.svg?branch=master)](https://travis-ci.org/marioluan/ruby-restful-api-example-rails-api)
[![Dependency Status](https://gemnasium.com/badges/github.com/marioluan/ruby-restful-api-example-rails-api.svg)](https://gemnasium.com/github.com/marioluan/ruby-restful-api-example-rails-api)
[![Code Climate](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api/badges/gpa.svg)](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api)
[![Test Coverage](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api/badges/coverage.svg)](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api/coverage)
[![Inline docs](http://inch-ci.org/github/marioluan/ruby-restful-api-example-rails-api.svg?branch=master)](http://inch-ci.org/github/marioluan/ruby-restful-api-example-rails-api)


## pre-requisites:
- ruby (v2.3.1)
- bundler (v1.12.5)

## running

```bash
$ docker-compose build rails-api-base
```

```bash
$ docker-compose build
```

```bash
$ docker-compose up -d
```

## running tests

```bash
$ docker-compose run rails-api-test
```

And head over to [http://localhost:3000/docs](http://localhost:3000/docs) to
interact with the api.

## useful documentation:
- [CHANGELOG.md](./CHANGELOG.md)
- [CONFIG.md](./CONFIG.md)
- [CONTRIBUTING.md](./CONTRIBUTING.md)
- [MONITORING.md](./MONITORING.md)
