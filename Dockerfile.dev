FROM elixir:1.15.4-alpine
WORKDIR /app
COPY . .

RUN apk add --update --no-cache \
  build-base \
  bash

RUN mix do local.hex --force, local.rebar --force
RUN mix do deps.get, deps.compile

EXPOSE 4000

CMD ["sh", "-c", "mix phx.server"]
