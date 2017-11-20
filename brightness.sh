#!/bin/bash


## https://askubuntu.com/questions/149054/how-to-change-lcd-brightness-from-command-line-or-via-script#comment1032783_469040 
direction=$1
function getCurrent()
{
  eval $1=$(cat /sys/class/backlight/intel_backlight/brightness)
}
function getMax()
{
  eval $1=$(cat /sys/class/backlight/intel_backlight/max_brightness)
}
function getMin()
{
  eval $1=$(cat /sys/class/backlight/intel_backlight/bl_power)
}
function getStep
{
  steps=20
  getMax max
  getMin min
  eval range=$(expr $max - $min)
  eval $1=$(expr $range / $steps)

}
getStep foo
echo $direction

getCurrent current
getStep step
if [[ $direction = "d" ]]; then
  eval newVal=$(expr $current - $step)
fi
if [[ $direction = "u" ]]; then
  eval newVal=$(expr $current + $step)
fi
echo $current
echo $newVal
echo $newVal>/sys/class/backlight/intel_backlight/brightness
