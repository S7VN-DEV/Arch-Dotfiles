#!/bin/bash

brightnessctl -s set 10

for i in {14..4}; do
  ddcutil setvcp 10 $i --display 1 --noverify >/dev/null
  sleep 0.01
done
