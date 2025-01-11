# pawpad-rails
Rails API for PawPad

## Local Development Instructions

### First-time Setup

You will need to install Docker Desktop and MySQL Workbench among other tooling. Read and follow these guides:

1. Docker MySQL Guide: https://hub.docker.com/_/mysql

2. Docker-Compose: https://medium.com/@chrischuck35/how-to-create-a-mysql-instance-with-docker-compose-1598f3cc1bee

3. gem install mysql2 --platform=ruby -- --with-mysql-dir="C:\Program Files\MySQL\MySQL Server 8.0"

It will do things, including "Installing required msys2 packages: mingw-w64-ucrt-x86_64-libmariadbclient"

$ gem install mysql2 --platform=ruby -- --with-mysql-include="C:\Program Files\MySQL\MySQL Server 8.0\include" --with-mysql-lib="C:\Program Files\MySQL\MySQL Server 8.0\lib" --with-cflags="-fno-stack-protector"

### Regular Setup

1. Start Docker Desktop application

2. From pawpad-rails root, if DB not already running once Docker loads: `docker-compose up -d`

3. From pawpad-rails root:
`bundle exec rails s`
