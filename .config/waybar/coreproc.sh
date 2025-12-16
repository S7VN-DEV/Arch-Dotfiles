#!/bin/bash


# cat /proc/cpuinfo | grep "MHz" | awk FNR==1'{print $4}' # needs for loop to cycle the FNR and add em up and then divide the total

mapfile -t MHZ < <(grep "MHz" /proc/cpuinfo | awk '{print $4}') # adjusted the command to use mapfile and set everything to an array MHZ, now to do avg
MHZ_length=${#MHZ[@]}
for ((i=0; i<$MHZ_length; i++))
do
  sum_expr="$sum_expr + ${MHZ[i]}"
done
sum=$(awk "BEGIN { print $sum_expr }")
MHZ_total=$(awk "BEGIN {print $sum / $MHZ_length}")

cpu_gov=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
if [[ "$cpu_gov" == "performance" ]]; then
  cpu_stat=$"\udb81\udcc5 PF"
elif [[ "$cpu_gov" == "powersave" ]]; then
  cpu_stat=$"\udb83\udf86 PS"
else
  cpu_stat=$"\ue654 Err"
fi


cpu_name=$(grep -m 1 "model name" /proc/cpuinfo | sed 's/model name\t*: //' | awk '{print $2" "$3" "$4}')
cpu_ghz=$(awk "BEGIN { printf \"%.1f\", $MHZ_total / 1000 }")
cpu_usage=$(top -bn1 | grep 'Cpu' | awk '{print 100 - $8}')
cpu_temp=$(sensors | grep Tctl | awk '{printf "%.0f", $2}' | sed 's/+//')

gpu_name=$(nvidia-smi --query-gpu=name --format=csv,noheader,nounits | sed 's/ GPU$//' | awk '{print $2" "$3" "$4}')
gpu_mhz=$(nvidia-smi --query-gpu=clocks.gr --format=csv,noheader,nounits)
gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

text=$(echo "$cpu_stat")
tooltip=$(echo "\uf4bc $cpu_name \udb85\udc7b $cpu_ghz""GHz\n$cpu_usage% \uf2c8 $cpu_temp°C\n\udb82\udc41 $gpu_name \udb85\udc7b $gpu_mhz""MHz\n$gpu_usage% \uf2c8 $gpu_temp°C") # may add dynamic temp

cat <<EOF
{"text": "$text", "tooltip": "$tooltip"}
EOF
