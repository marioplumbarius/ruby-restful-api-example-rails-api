# Contributing

Follow [github flow](https://guides.github.com/introduction/flow/) to contribute.

In summary:

## clone the repository
```bash
$ git clone https://github.com/marioluan/ruby-restful-api-example-rails-api.git
```

## create a feature branch
```bash
$ git checkout -b <descriptive_branch_name>
```

## add commits
**Before commiting new changes:**

### run the static code analyzer
```bash
$ bundle exec rubocop -S
```
**Note: Fix reported errors.**

### run unit tests
```bash
$ bundle exec rspec
```
**Note: Write unit tests for new code and modify existing ones, where necessary.**

### check code coverage report
Code coverage report will be automatically generated to `coverage/index.html`.

**Note: New code cannot decrease the code coverage percentage.**

### commit new changes
```bash
$ git commit -m <short_and_descriptive_message>
```
**Note: No commits can break the branch.**

## open a pull request
## discuss and review your code
## deploy
