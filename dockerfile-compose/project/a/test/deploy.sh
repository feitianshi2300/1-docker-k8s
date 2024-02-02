#!/usr/bin/env bash
root_path=$(dirname "$0")



case $1 in
deploy)
    cd ${root_path} && docker compose -f docker-compose.yml up -d
  ;;
down)
    cd ${root_path} && docker compose -f docker-compose.yml down
  ;;
update)
    cd ${root_path} && docker compose -f docker-compose.yml up -d
  ;;
stop)
    cd ${root_path} && docker compose -f docker-compose.yml up -d
  ;;
reload)
    cd ${root_path} && docker compose -f docker-compose.yml reload -d
  ;;
esac