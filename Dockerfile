FROM ruby:2.3.1

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs

WORKDIR /rails-api
ADD Gemfile /rails-api/

RUN bundle install

ADD . /rails-api
