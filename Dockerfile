ARG APP_DIR=/opt/app

FROM ruby:2.6.10
ARG APP_DIR
WORKDIR ${APP_DIR}
COPY Gemfile Gemfile.lock ./
RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev nodejs redis-tools \
    && gem update --system 3.2.3 \
    && gem install bundler -v 2.4.22 \
    && bundle install

COPY . .

CMD ["rails", "s", "-b", "0.0.0.0"]

EXPOSE 3000
