FROM bluebu/rails-alpine:latest

ENV APP_HOME /usr/app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install base and dev packages
RUN apk update && apk add build-base postgresql-dev libffi-dev

# Clean apk cache
RUN rm -rf /var/cache/apk/*

ADD Gemfile* $APP_HOME/

RUN bundle install

ADD . $APP_HOME

EXPOSE 3000

CMD rails server -b 0.0.0.0
