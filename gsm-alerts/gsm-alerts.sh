#!/usr/bin/env bash

config="${CONFIG:-/etc/gsm-alerts/config}"

if [ -f $config ]; then
    source $config
else
    echo "configuration file not found:"
    echo "$ cat $config
endpoints=(
  example.com::group1,group3
  test.example.com::group2
)

contacts=(
 \"+33123456789::group1,group2\"
 \"+33123456789::group2\"
)

statusdir=/tmp/gsm-alerts

criticalThreshold=300
"
    exit 1
fi

function alert {
    groups=($(echo "${1}" | tr "," "\n"))
    message="${2}"

    for group in ${groups[@]}; do
        for entry in ${contacts[@]}; do
            number="${entry%::*}"
            cgroups=($(echo "${entry#*::}" | tr "," "\n"))
            for cgroup in ${cgroups[@]}; do
                if [ "${cgroup}" == "${group}" ]; then
                    sendsms -n "${number}" -m "ALERT: $message"
                    break
                fi
            done
        done
    done
}

for entry in ${endpoints[@]}; do
    endpoint=${entry%::*}

    ping -c 1 -W 5 $endpoint
    if [ $? -ne 0 ]; then
        mkdir -p "${statusdir}/${endpoint}/"
        if [ ! -f "${statusdir}/${endpoint}/last" ]; then
            # first time KO
            date -u +%s > "${statusdir}/${endpoint}/last"
        fi

        elapsedTimeSinceDown=$(($(date -u +%s) - $(cat ${statusdir}/${endpoint}/last)))
        if [ $elapsedTimeSinceDown -ge $criticalThreshold ] && [ ! -f "${statusdir}/${endpoint}/sent" ]; then
            # first time greater than threshold
            alert "${entry#*::}" "${endpoint} has been DOWN since $(date -d @$(cat "${statusdir}/${endpoint}/last"))."
            touch "${statusdir}/${endpoint}/sent"
        fi
    else
        if [ -f "${statusdir}/${endpoint}/sent" ]; then
            # redemption
            elapsedTimeSinceDown=$(($(date -u +%s) - $(cat ${statusdir}/${endpoint}/last)))
            alert "${entry#*::}" "${endpoint} is now UP. It was down for ${elapsedTimeSinceDown} seconds, since $(date -d @$(cat "${statusdir}/${endpoint}/last"))."
        fi
        rm -rf "${statusdir}/${endpoint}/"
    fi
done
