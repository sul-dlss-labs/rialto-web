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

## Simulate logged in users

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
