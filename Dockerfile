FROM marcelocg/phoenix

ADD package.json /code/package.json
ADD mix.exs /code/mix.exs
ADD brunch-config.js /code/brunch-config.js

RUN /usr/local/bin/mix local.hex --force
RUN /usr/local/bin/mix local.rebar --force

RUN cd /code && mix deps.get -y && npm install -q

WORKDIR /code
EXPOSE 4000

CMD mix phoenix.server