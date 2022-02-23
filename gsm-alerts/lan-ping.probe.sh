#!/usr/bin/env bash

endpoint=$1

ping -c 1 -W 5 $endpoint > /dev/null
exit $?
