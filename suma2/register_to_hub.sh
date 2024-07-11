#!/bin/bash

if [ $# -eq 0 ]; then
    >&2 echo "You should use two arguments here: <api_password> and <api_server> - e.g. password123 and hub.example.com"
    exit 1
fi

mgradm hub register --api-password '$1' --api-server '$2' --api-user admin
