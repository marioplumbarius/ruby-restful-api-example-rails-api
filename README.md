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

### run migrations
```bash
$ bundle exec rails db:migrate RAILS_ENV=development
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
