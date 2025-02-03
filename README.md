# README

Foster pet management app.

## Local Development Instructions

General information
* Ruby version: 3.3.4
* Rails version: 8.0.1
* DB: PostgreSQL
* Test framework: Minitest

First-time steps to run the app locally:
1. Clone the repo
2. Configure `config/database.yml` (e.g. user credentials)
3. Run `createuser -P -d pawpad` and set password (store it in ENV variable `PAWPAD_DATABASE_PASSWORD`)
4. Run `bundle install`
5. Run `bundle exec rails db:create`
6. Run `bundle exec rails db:migrate`
7. Run `bundle exec rails db:seed`

To start local server:
* Run `bundle exec rails s`

To start docker container:
* Run `docker-compose up -d`

To run the tests:
* Run `bundle exec rails test`
