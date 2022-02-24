#!/usr/bin/env bash

config="${CONFIG:-/etc/gsm-alerts/config}"

if [ -f $config ]; then
    source $config
else
    echo "configuration file not found."
    exit 1
fi

probedir="${probedir:-/etc/gsm-alerts/probes}"
statusdir="${statusdir:-/tmp/gsm-alerts}"
defaultThreshold=${defaultThreshold:-300}
defaultProbe="${defaultProbe:-lan-ping}"
devel=${devel:-0}

function getContactNumber {
    echo $1 | cut -d':' -f1
}

function getContactLabels {
    echo $1 | cut -d':' -f2
}

function getEndpointFQDN {
    echo $1 | cut -d':' -f1 | cut -d',' -f1
}

function getEndpointParameters {
    echo $1 | cut -d':' -f1 | cut -d',' -f2-
}

function getEndpointName {
    local name=$(echo $1 | cut -d':' -f2)

    if [ -z $name ]; then
        echo $(getEndpointFQDN $1)
    else
        echo $name
    fi
}

function getEndpointThreshold {
    local threshold=$(echo $1 | cut -d':' -f3)

    if [ -z $threshold ]; then
        echo $defaultThreshold
    else
        echo $threshold
    fi
}

function getEndpointProbe {
    local probe=$(echo $1 | cut -d':' -f4)

    if [ -z $probe ]; then
        echo $defaultProbe
    else
        echo $probe
    fi
}

function getEndpointLabels {
    echo $1 | cut -d':' -f5
}

function alert {
    local groups=($(echo "${1}" | tr "," "\n"))
    local message="${2}"

    for group in ${groups[@]}; do
        for entry in ${contacts[@]}; do

            local number=$(getContactNumber "${entry}")
            local clabels=$(getContactLabels "${entry}" | tr "," "\n")

            for clabel in ${clabels[@]}; do
                if [ "${clabel}" == "${group}" ]; then
                    if [ $devel -ne 0 ]; then
                        echo "sendsms -n \"${number}\" -m \"ALERT: $message\""
                    else
                        sendsms "${number}" "ALERT: $message"
                    fi
                    break
                fi
            done
        done
    done
}

for entry in ${endpoints[@]}; do
    endpoint=$(getEndpointFQDN "${entry}")
    parameters=$(getEndpointParameters "${entry}")
    name=$(getEndpointName "${entry}")
    threshold=$(getEndpointThreshold "${entry}")
    labels=$(getEndpointLabels "${entry}")
    probe=$(getEndpointProbe "${entry}")

    if [ -f "${probedir}/${probe}.sh" ]; then
        "${probedir}/${probe}.sh" "${endpoint}" "${parameters}"
        ret=$?
    else
        ret=1
    fi

    if [ $ret -ne 0 ]; then
        mkdir -p "${statusdir}/${endpoint}/"
        if [ ! -f "${statusdir}/${endpoint}/last" ]; then
            # first time KO
            date -u +%s > "${statusdir}/${endpoint}/last"
        fi

        elapsedTimeSinceDown=$(($(date -u +%s) - $(cat ${statusdir}/${endpoint}/last)))
        if [ $elapsedTimeSinceDown -ge $threshold ] && [ ! -f "${statusdir}/${endpoint}/sent" ]; then
            # first time greater than threshold
            alert "${labels}" "${name} has been DOWN since $(date -d @$(cat "${statusdir}/${endpoint}/last"))."
            touch "${statusdir}/${endpoint}/sent"
        fi
    else
        if [ -f "${statusdir}/${endpoint}/sent" ]; then
            # redemption
            elapsedTimeSinceDown=$(($(date -u +%s) - $(cat ${statusdir}/${endpoint}/last)))
            alert "${labels}" "${name} is now UP. It was down for $(($elapsedTimeSinceDown / 3600)) hours, $(($elapsedTimeSinceDown % 3600 / 60)) minutes and $(($elapsedTimeSinceDown % 60)) seconds, since $(date -d @$(cat "${statusdir}/${endpoint}/last"))."
        fi
        rm -rf "${statusdir}/${endpoint}/"
    fi
done
