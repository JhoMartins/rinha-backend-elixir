FROM elixir:1.15.4-alpine as builder

RUN apk add --update --no-cache build-base 

WORKDIR /app
COPY . .

RUN mix do local.hex --force, local.rebar --force

ENV MIX_ENV="prod"

RUN mix do deps.get --only $MIX_ENV, deps.compile

RUN mix compile

RUN mix release

FROM alpine:3.17 as release

RUN apk add --update --no-cache ncurses-libs libstdc++ bash

WORKDIR /app

ENV MIX_ENV="prod"

COPY --from=builder /app/_build/${MIX_ENV}/rel/rinha_backend_elixir ./

CMD ["sh", "-c", "PHX_SERVER=true exec ./bin/rinha_backend_elixir start"]
