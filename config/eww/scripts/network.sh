#!/bin/bash

symbol() {
    [ $(cat /sys/class/net/w*/operstate) = down ] && echo 󰤮  && exit
    signal=$(cat /proc/net/wireless | awk '{if(NR == 3){print substr($3,1,2)    }}')
    if (($signal < 14));
    then
        echo 󰤯
    elif (($signal < 28));
    then
        echo 󰤟
    elif (($signal < 42));
    then
        echo 󰤢
    elif (($signal < 56));
    then
        echo 󰤥
    else
        echo 󰤨
    fi
}

name() {
  iwgetid -r
}

cut () {
  toshow="$1"
  maxlen="$2"

  sufix=""

  if test $(echo $toshow | wc -c) -ge $maxlen ; then
    sufix=""
  fi

  echo "${toshow:0:$maxlen}$sufix"
}

[ "$1" = "icon" ] && symbol

if [[ $1 == "ssid" ]]; then
  ssid=$(name)
  if [[ "$ssid" == "" ]]; then
    cut "Disconnected" 10
  else
    cut "$ssid" 10
  fi
fi

if [[ $1 == "name" || $1 == "class" ]]; then
  wifiname=$(name)
  if [[ $wifiname == "" ]]; then
    if [[ $1 == "name" ]]; then
      echo "Disconnected"
    elif [[ $1 == "class" ]]; then
      echo "disconnected"
    fi
  else
    if [[ $1 == "name" ]]; then
      echo "Connected to $wifiname"
    elif [[ $1 == "class" ]]; then
      echo "connected"
    fi
  fi
fi

if [[ $1 == "status" ]]; then
  name=$(name)
  if [[ $name != "" ]]; then
    echo "Connected"
  else
    echo "Disconnected"
  fi
fi

if [[ $1 == "disconnect" ]]; then
  local wifiname="nmcli d | grep wifi | sed 's/^.*wifi.*connected//g' | xargs"
  nmcli con down id "${wifiname}"
fi

radio_status () {
  radio_status=$(nmcli radio wifi)
  if [[ $radio_status == "enabled" ]]; then
    echo "on"
  else
    echo "off"
  fi
}

if [[ $1 == "radio-status" ]]; then
  radio_status
fi

if [[ $1 == "toggle-radio" ]]; then
  stat=$(radio_status)
  if [[ $stat == "on" ]]; then
    nmcli radio wifi off
  else
    nmcli radio wifi on
  fi
fi
