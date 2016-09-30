#!/bin/bash

git init
git submodule init
git submodule update
bundle exec rake swagger:docs
