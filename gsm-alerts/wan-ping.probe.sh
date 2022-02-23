#!/usr/bin/env bash

endpoint=$1

ping -c 1 -W 5 8.8.8.8 > /dev/null
if [ $? -eq 0 ]; then
    ping -c 1 -W 5 $endpoint > /dev/null
    exit $?
fi
