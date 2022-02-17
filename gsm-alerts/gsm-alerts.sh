#!/usr/bin/env bash

config="${CONFIG:-/etc/gsm-alerts/config}"

if [ -f $config ]; then
    source $config
else
    echo "configuration file not found:"
    echo "$ cat $config
endpoints=(
  example.com
)

contacts=(
 \"+33123456789\"
)

statusdir=/tmp/gsm-alerts

criticalThreshold=300
"
    exit 1
fi

function alert {
    message="${1}"

    for contact in ${contacts[@]}; do
        sendsms -n "${contact}" -m "ALERT: ${message}"

        # retry once on failure
        if [ $? -ne 0 ]; then
            sendsms -n "${contact}" -m "ALERT: ${message}"
        fi
    done
}

for endpoint in ${endpoints[@]}; do
    ping -c 1 -W 5 $endpoint
    if [ $? -ne 0 ]; then
        mkdir -p "${statusdir}/${endpoint}/"
        if [ ! -f "${statusdir}/${endpoint}/last" ]; then
            # first time KO
            date -u +%s > "${statusdir}/${endpoint}/last"
        fi

        elapsedTimeSinceDown=$(echo "$(date -u +%s) - $(cat ${statusdir}/${endpoint}/last)" | bc)
        if [ $elapsedTimeSinceDown -ge $criticalThreshold ] && [ ! -f "${statusdir}/${endpoint}/sent" ]; then
            # first time greater than threshold
            alert "${endpoint} has been DOWN since $(date -d @$(cat "${statusdir}/${endpoint}/last"))."
            touch "${statusdir}/${endpoint}/sent"
        fi
    else
        if [ -f "${statusdir}/${endpoint}/sent" ]; then
            # redemption
            elapsedTimeSinceDown=$(echo "$(date +%s) - $(cat ${statusdir}/${endpoint}/last)" | bc)
            alert "${endpoint} is now UP. It was down for ${elapsedTimeSinceDown} seconds, since $(date -d @$(cat "${statusdir}/${endpoint}/last"))."
        fi
        rm -rf "${statusdir}/${endpoint}/"
    fi
done
