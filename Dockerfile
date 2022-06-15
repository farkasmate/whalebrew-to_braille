ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}-alpine as BUILDER

WORKDIR /code

ADD Gemfile Gemfile.lock ./

RUN apk add --update \
    alpine-sdk \
    ncurses-dev \
  && bundle config set --local without 'development' \
  && bundle install

# CLI
FROM ruby:${RUBY_VERSION}-alpine as CLI

COPY --from=BUILDER /usr/local/bundle /usr/local/bundle

ADD entrypoint.rb /entrypoint.rb

ENTRYPOINT ["/entrypoint.rb"]
