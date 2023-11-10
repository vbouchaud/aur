#!/usr/bin/env bash

for f in $(ls); do
    if [ -d $f ]; then
        echo "package: $f"
        cd $f
        makepkg --printsrcinfo > .SRCINFO
        cd ..
    fi
done
