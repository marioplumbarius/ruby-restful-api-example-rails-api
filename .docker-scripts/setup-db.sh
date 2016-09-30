#!/bin/bash

bundle exec rails db:migrate
bundle exec rails db:factories:load
