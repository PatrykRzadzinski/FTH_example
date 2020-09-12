#!/bin/bash
#
docker run \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --volume=/srv/drone:/data \
  --volume=/etc/letsencrypt/live/rzski.com/privkey.pem:/etc/letsencrypt/live/rzski.com/privkey.pem \
  --volume=/etc/letsencrypt/live/rzski.com/fullchain.pem:/etc/letsencrypt/live/rzski.com/fullchain.pem \
  --env=DRONE_GITHUB_SERVER=https://github.com \
  --env=DRONE_GITHUB_CLIENT_ID=myid \
  --env=DRONE_GITHUB_CLIENT_SECRET=something \
  --env=DRONE_RUNNER_CAPACITY=2 \
  --env=DRONE_SERVER_HOST=myhost.com:443 \
  --env=DRONE_SERVER_PROTO=https \
  --env=DRONE_RPC_SECRET=somepass123 \
  --env=DRONE_TLS_AUTOCERT=false \
  --env=DRONE_TLS_CERT=/etc/letsencrypt/live/rzski.com/fullchain.pem \
  --env=DRONE_TLS_KEY=/etc/letsencrypt/live/rzski.com/privkey.pem \
  --env=DRONE_COOKIE_SECRET=some_string_as_secret \
  --publish=8000:80 \
  --publish=4443:443 \
  --restart=always \
  --detach=true \
  --name=drone \
  drone/drone:1
