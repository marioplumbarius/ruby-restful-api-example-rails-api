# ruby-restful-api-example-rails-api
**RESTful API sample using `rails api`.**

[![Build Status](https://travis-ci.org/marioluan/ruby-restful-api-example-rails-api.svg?branch=master)](https://travis-ci.org/marioluan/ruby-restful-api-example-rails-api)
[![Dependency Status](https://gemnasium.com/badges/github.com/marioluan/ruby-restful-api-example-rails-api.svg)](https://gemnasium.com/github.com/marioluan/ruby-restful-api-example-rails-api)
[![Code Climate](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api/badges/gpa.svg)](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api)
[![Test Coverage](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api/badges/coverage.svg)](https://codeclimate.com/github/marioluan/ruby-restful-api-example-rails-api/coverage)
[![Inline docs](http://inch-ci.org/github/marioluan/ruby-restful-api-example-rails-api.svg?branch=master)](http://inch-ci.org/github/marioluan/ruby-restful-api-example-rails-api)

***Note: To run the application in your local environment head over [README.md](/README.md).***

***

## pre-requisites:
- docker (v1.12.1)

## running
### 1. load swagger-ui
```bash
$ git submodule init
$ git submodule update
```

### 2. build the docker image
```bash
$ source .dockerenv
$ docker build -t $IMAGE_NAME .
```

### 3. start the app
```bash
$ source .dockerenv
$ docker run \
    --rm \
    --name $CONTAINER_NAME \
    -p 3000:3000/tcp \
    $IMAGE_NAME
```

And head over to [http://localhost:3000/docs](http://localhost:3000/docs) to
interact with the api.

## useful documentation:
- [CHANGELOG.md](./CHANGELOG.md)
- [CONFIG.md](./CONFIG.md)
- [CONTRIBUTING.md](./CONTRIBUTING.md)
- [MONITORING.md](./MONITORING.md)
