# README

Foster pet management app.

## Local Development Instructions

1. Clone repo
2. Run `createuser -P -d pawpad` and set password (store it in ENV variable `PAWPAD_DATABASE_PASSWORD`)
3. Run `bundle exec rails db:create`
4. Run `bundle exec rails db:seed`
5. Run `bundle install`
6. Run `bundle exec rails s` to run server locally
7. Run `docker-compose up -d` to start running docker container
