#!/bin/bash
#
docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e DRONE_RPC_PROTO=https \
  -e DRONE_RPC_HOST=myhost.com:4443 \
  -e DRONE_RPC_SECRET=somepass123 \
  -e DRONE_RUNNER_CAPACITY=2 \
  -e DRONE_RUNNER_NAME=myhost \
  -p 3000:3000 \
  --restart always \
  --name runner \
  drone/drone-runner-docker:1
