# Contributing

Follow [github flow](https://guides.github.com/introduction/flow/) to contribute.

In summary:

## 1. clone the repository
```bash
$ git clone https://github.com/marioluan/ruby-restful-api-example-rails-api.git
```

## 2. create a feature branch
```bash
$ git checkout -b <descriptive_branch_name>
```

## 3. add commits
**Before commiting new changes:**

### 3.1. run the static code analyzer
```bash
$ bundle exec rubocop -S
```
**Note: Fix reported errors.**

### 3.2. run unit tests
```bash
$ bundle exec rspec
```
**Note: Write unit tests for new code and modify existing ones, where necessary.**

### 3.4. check code coverage report
Code coverage report will be automatically generated to `coverage/index.html`.

**Note: New code cannot decrease the code coverage percentage.**

### 3.5. commit new changes
```bash
$ git commit -m <short_and_descriptive_message>
```
**Note: No commits can break the branch.**

## 4. open a pull request
## 5. discuss and review your code
## 6. deploy
