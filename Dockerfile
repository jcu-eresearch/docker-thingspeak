FROM ruby:2.1-slim
MAINTAINER "JCU eResearch Centre" <eresearch.nospam@jcu.edu.au>

ENV DEBIAN_FRONTEND noninteractive

# ThingSpeak installation
RUN apt-get update && apt-get install -y \
  g++ \
  gcc \
  git \
  libsqlite3-dev \
  libmysqlclient-dev \
  libpq-dev \
  make
RUN git clone https://github.com/iobridge/thingspeak.git /opt/thingspeak
WORKDIR /opt/thingspeak
RUN echo "gem 'pg'" >> /opt/thingspeak/Gemfile && bundle install

# Database and environment configuration
# TODO env variables
#COPY database.yml config/database.yml
#COPY environment.rb config/environment.rb

# Limited access user creation and config
RUN groupadd -r thingspeak && useradd -r -g thingspeak thingspeak
RUN mkdir log tmp && chown -R thingspeak:thingspeak log tmp

# Run the CMD as the limited access user
USER thingspeak

# TODO Change to uWSGI and Unix sockets for nginx?
EXPOSE 3000

CMD bundle exec rails server -p 3000
