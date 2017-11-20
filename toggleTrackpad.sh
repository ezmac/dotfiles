#!/bin/bash


#https://askubuntu.com/questions/65951/how-to-disable-the-touchpad
function getCurrent()
{
  eval $1=$(xinput --list-props 12|grep --color=never "Device Enabled"|cut -f3)
xinput --list-props 12|grep --color=never "Device Enabled"
}

getCurrent current
echo trying to spit out current
echo $current
if [[ $current = "1" ]]; then
  xinput --disable 12
  echo "Disabled"
fi
if [[ $current = "0" ]]; then
  echo "Enabled"
  xinput --enable 12
fi
