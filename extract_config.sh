#!/bin/bash

docker compose exec server /bin/bash -c 'mkdir -p /current_config; cp /conan_exiles/ConanSandbox/Saved/Config/WindowsServer/*.ini /current_config/'
docker compose cp server:/current_config .
docker compose exec server /bin/bash -c 'rm -rf /current_config'

