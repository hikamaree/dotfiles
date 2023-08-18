#!/usr/bin/env bash

capitalize () {
  toshow="$1"
  maxlen="$2"

  sufix=""

  if test $(echo $toshow | wc -c) -ge $maxlen ; then
    sufix=" ..."
  fi

  echo "${toshow:0:$maxlen}$sufix"
}

withSafe () {
  local txt="$1"
  local safe="$2"
  if [[ $txt == "" ]]; then
    echo $safe
  else
    echo $txt
  fi
}

if [[ $1 == "title" ]]; then
  capitalize "$(mpc -f %title% | awk '{if (NR==1) {print}}' || echo "Not playing")" 30
fi

if [[ $1 == "artist" ]]; then
    withSafe "$(capitalize "$(mpc -f %artist% | awk '{if (NR==1) {print}}' || echo "No artist")" 30)" "No artist detected"
fi

if [[ $1 == "status" ]]; then
   mpc status | awk '{if (NR==2) {print$1}}'
fi
