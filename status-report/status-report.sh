#!/usr/bin/env bash

config="${CONFIG:-/etc/status-report/config}"

if [ -f "$config" ]; then
    # shellcheck source=config
    source "$config"
else
    echo "configuration file not found."
    exit 1
fi

ssh -T "${remote_user}@${endpoint}" -i "${private_key}"
