#!/usr/bin/env bash

if [[ $1 == "prev" ]]; then
    mpc prev
fi

if [[ $1 == "play-pause" ]]; then
    status=$(mpc status | grep play)

    if [ -n "$status" ]
    then
        mpc pause >> /dev/null
    else
        mpc play >> /dev/null
    fi
fi

if [[ $1 == "next" ]]; then
    mpc next
fi
