# [The  Futurist Party](//reddit.com/r/futuristparty) Voting Interface

[![tip for next commit](http://tip4commit.com/projects/827.svg)](http://tip4commit.com/projects/827) [![Codeship Status](https://www.codeship.io/projects/0b2a3570-0fc8-0132-0248-129d6db6c348/status)](https://www.codeship.io/projects/32717)
======

# Improvements

## Term Length

| _Current_ | _New_ |
|-----------|-------|
| Fixed terms, 2-8 years. | At-will electronically-delegated terms. |

## Election Process

| _Current_ | _New_ |
|-----------|-------|
| Nomination then election. | Any account can proxy. [Elegibility verification using election commission rolls.](#identity-verification) |

## Granularity

| _Current_ | _New_ |
|-----------|-------|
| One delegate for all issues. | Proxy rights can be allotted topically based on keywords assigned by organizations.  |

# Identity Verification

1. User creates account
2. User enters registered voting address
3. Address is verified against election commission records
4. Code is sent to user via postal mail
5. User enters code into application
6. Account is verified

A Sybil account cannot be created without falsifying election commission records.

# Participation

Development information is spread out over a few services:

* [Development Listserv](https://groups.google.com/forum/#!forum/debate-dev/)
* [Github Repo](https://github.com/TheFuturistParty/vote/)
* [Futurist Party Slack](https://futuristparty.slack.com/messages/web-dev/)

Installation
------------

### Locally

1. `sudo apt-get install git`
2. `git clone https://github.com/TheFuturistParty/debate.git`
3. `curl -sSL https://get.rvm.io | bash`
4. `source ~/.rvm/scripts/rvm`
5. `cd debate`
6. `rvm install ruby-2.1.2`
7. `bundle install`
8. *optional* edit `config/secrets.yml` and change the admin credentials
9. `rake db:create db:migrate db:seed`
10. `rails s`
11. `chrome http://localhost:3000`

### Heroku

- `git clone https://github.com/TheFuturistParty/debate.git`
- `cd debate`
- `heroku create app dbate`
- `heroku addons:add heroku-postgresql`
- `heroku config:add DOMAIN_NAME='dbate.herokuapp.com'`
- `git push heroku master`
- `heroku config:add ADMIN_NAME='admin'`
- `heroku config:add ADMIN_EMAIL='root@futuristparty.org' ADMIN_PASSWORD='secret'`
- `heroku run rake db:migrate db:seed`
- `rake figaro:heroku`

If you change anything, it has to be precompiled before it is sent to Heroku.

- `RAILS_ENV=production rake assets:precompile`
- `git add -A`
- `git commit -m 'compiled assets'`
- `git push heroku master`

## Loading bills from the Sunlight Foundation

To load bills from the Congress API:

* Get a key for the [Congress API](http://tryit.sunlightfoundation.com/congress) and put it in `config/application.yml` as `SUNLIGHT_KEY`.
* `rails c`
* `Issue.load_bills`

This will create `Issue`s and associated `Tag`s for the first ten bills retrieved having keywords.
