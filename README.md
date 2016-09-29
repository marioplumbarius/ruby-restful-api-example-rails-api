# ruby-restful-api-example-rails-api
RESTful API sample using `rails api`.

## pre-requisites:
- ruby (v2.3.1)
- bundler (v1.12.5)

## running
### download the dependencies
```bash
$ bundle install --path=vendor
```

### generate the api documentation
```bash
$ bundle exec rake swagger:docs
```

### start the app
```bash
$ bundle exec rails server
```

And head over [http://localhost:3000/docs](http://localhost:3000/docs) to
interact with available endpoints.

## useful documentation:
- [CHANGELOG.md](./CHANGELOG.md)
- [CONFIG.md](./CONFIG.md)
- [CONTRIBUTING.md](./CONTRIBUTING.md)
- [MONITORING.md](./MONITORING.md)
