[![CircleCI](https://dl.circleci.com/status-badge/img/gh/sul-dlss-labs/rialto-web/tree/main.svg?style=svg&circle-token=CCIPRJ_9bhFDje9h5tLZ8dRs2Jbrp_ef783e585b071f6c23ce5c1e72942cf0210f98f5)](https://dl.circleci.com/status-badge/redirect/gh/sul-dlss-labs/rialto-web/tree/main)

# RIATLO Web App

Test RIALTO Web App 2025

## Setup

```
rails db:migrate
```

## Running

```
rails s
```

Quick start with a logged in user with workgroup access:
```
bin/dev
```

### Simulate logged in users

Note that the login button doesn't do anything in localhost since shib is not available.  You can simulate
a logged in shib user with an environment variable:

```
REMOTE_USER=peter rails s
```


A logged in user in a single workgroup:

```
REMOTE_USER=peter ROLES=sul:rialto rails s
```

A logged in user in multiple workgroup:
```
REMOTE_USER=peter ROLES=sul:rialto;sul:dlss rails s
```

## Tests

Run lint:
```
bundle exec rubocop
bundle exec erb_lint --lint-all --format compact
```

Run tests:
```
bundle exec rspec
```
