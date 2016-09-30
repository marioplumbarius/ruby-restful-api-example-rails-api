FROM ruby:2.3.1-alpine

MAINTAINER Mario Luan <mariosouzaluan@gmail.com>

# necessary to build app's dependencies
ENV GENERAL_PACKAGES build-base
ENV SQLITE_PACKAGE sqlite-dev
ENV TZINFO_PACKAGE tzdata

# install dependencies
RUN apk add --update \
              $GENERAL_PACKAGES \
              $SQLITE_PACKAGE \
              $TZINFO_PACKAGE \
              && rm -rf /var/cache/apk/*

# copies all files from app
ADD . /app

# sets the working directory
WORKDIR /app

# download the dependencies
RUN rm -rf vendor && bundle install --path=vendor

# run pending migrations
RUN bundle exec rails db:migrate

# populate the database with random data
RUN bundle exec rails db:factories:load

# generate the api documentation
RUN bundle exec rake swagger:docs

# start the app
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
