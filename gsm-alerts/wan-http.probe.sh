#!/usr/bin/env bash

endpoint=$1
parameters=$2

scheme=$(echo $parameters | cut -d',' -f1)
route=$(echo $parameters | cut -d',' -f2)

ping -c 1 -W 5 8.8.8.8 > /dev/null
if [ $? -eq 0 ]; then
    code=$(curl -s -o /dev/null -I -w "%{http_code}" --max-time 5 ${scheme}://${endpoint}${route})
    exit $(($code < 200 || $code > 399))
fi
