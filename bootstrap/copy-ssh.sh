#!/bin/bash

if [ $# -eq 0 ]; then
    >&2 echo "No arguments provided"
    exit 1
fi

ssh-copy-id root@$1
