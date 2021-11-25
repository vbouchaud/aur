#!/usr/bin/env bash

CONFIG_FILE="${CONFIG_FILE:-/etc/dnsmasq.d/blacklist.conf}"

lists=(
    "pgl.yoyo.org::https://pgl.yoyo.org/adservers/serverlist.php?hostformat=dnsmasq-server&showintro=1&mimetype=plaintext"
    "notracking-hosts-blocklists::https://raw.githubusercontent.com/notracking/hosts-blocklists/master/dnsmasq/dnsmasq.blacklist.txt"
)

tmpdir="$(mktemp -d)"

for list in "${lists[@]}"; do
    filename="${tmpdir}/${list%::*}"
    curl -SLso "${filename}" "${list#*::}"
    sed -i "s~^#.*~~g;s+address=+server=+g;s+/#+/+g" "${filename}"
done

sort -u $(find "${tmpdir}" -type f) > "${CONFIG_FILE}"
