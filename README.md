# ruby-restful-api-example-rails-api
RESTFul API sample using `rails api`.

## documentation:
- [CHANGELOG.md](./CHANGELOG.md)
- [CONFIG.md](./CONFIG.md)
- [CONTRIBUTING.md](./CONTRIBUTING.md)
- [MONITORING.md](./MONITORING.md)

## pre-requisites:
- ruby (v2.3.1)
- bundler (v1.12.5)

## running
#### download the dependencies
```bash
$ bundle install --path=vendor
```

#### start the app
```bash
$ bundle exec rails server
```

#### list available routes to interact with the API
```bash
$ bundle exec rake routes
```

## API documentation
Generate documentation to `./public/docs`.
```bash
$ bundle exec rake swagger:docs
```
