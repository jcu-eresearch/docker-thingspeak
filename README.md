# ThingSpeak Docker Config

## Features

* Installs and configures Postgres
* Installs and configures ThingSpeak
* Patches [issue #43](https://github.com/iobridge/thingspeak/issues/43) for
  ThingSpeak
* Installs and configures nginx as the front-end web server
* Configures Let's Encrypt SSL certificates for use with nginx

## Installation

Install Docker and Docker Compose and provision like so:

   docker-compose up -d

On the first run, configure the database accordingly:

   docker-compose run --rm web bundle exec rake db:create
   docker-compose run --rm web bundle exec rake db:schema:load

## Todo

* Backup of postgres
* Let's Encrypt and automatic updates
