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

A logged in user:

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
