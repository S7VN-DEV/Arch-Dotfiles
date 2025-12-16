#!/bin/bash
# memory
mem_total=$(free --giga | awk '/^Mem:/ {print $2}')
mem_usage=$(free --giga | awk '/^Mem:/ {print $3}')
# vram
vmem_usage=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits | awk '{printf "%.2f\n", $1 / 1024}')
vmem_total=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits | awk '{printf "%.0f\n", $1 / 1024}')
# home disk
dsk_home_usage=$(df -hT "$HOME" | awk 'NR==2 {print $4}')
dsk_home_total=$(df -hT "$HOME" | awk 'NR==2 {print $3}')
# additional disk
dsk_n2_usage=$(df -hT "$HOME/MoarSpace" | awk 'NR==2 {print $4}')
dsk_n2_total=$(df -hT "$HOME/MoarSpace" | awk 'NR==2 {print $3}')

text=$(echo "\uefc5  $mem_usage""G")
tooltip=$(echo "RAM:    $mem_usage""GiB/$mem_total""GiB\nVRAM:   $vmem_usage""GiB/$vmem_total""GiB\nDisk 1: $dsk_home_usage""b/$dsk_home_total""b\nDisk 2: $dsk_n2_usage""b/$dsk_n2_total""b")


cat <<EOF
{"text": "$text", "tooltip": "$tooltip"}
EOF
