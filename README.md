[![CircleCI](https://dl.circleci.com/status-badge/img/gh/sul-dlss-labs/rialto-web/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/sul-dlss-labs/rialto-web/tree/main)

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

## Website Access Levels

There are three base controllers that determine access levels:
1. PublicController - any controllers which subclass from this controller will have views that are visible to anyone
2. StanfordController - any controllers which subclass from this controller will have views that require the user to be webauthed (but no specific workgroups are checked)
3. RestrictedController - any controllers which subclass from this controller will have views that both require a user to be webauthed, in addition to be part of the workgroup defined in the settings.yml file (as checked in the RestrictedPolicy)

Note that if required you can create additional policies and additional controllers to check membership in other workgroups.  You will need to be sure that the additional workgroups you are checking membership for are passed through from shibboleth to the app on login.  This requires filing an Ops ticket, e.g. https://github.com/sul-dlss/operations-tasks/issues/4238

## Tests

All of the below checks are part of the default Rake task, and so will run if you call `bin/rake`.

You can run individual checks with the following commands:

Run lint:
```
bundle exec rubocop
bundle exec erb_lint --lint-all --format compact
```

Run tests:
```
bundle exec rspec
```

Run Brakeman (static security analysis):
```
bin/brakeman
```
