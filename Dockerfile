FROM elixir:1.8.2-alpine

RUN apk update
RUN apk add bash
RUN apk add inotify-tools
RUN apk add nodejs-current
RUN apk add npm
RUN apk add imagemagick

ENV APP_PATH /app
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

COPY . ./

RUN mix local.hex --force
RUN mix local.rebar --force
