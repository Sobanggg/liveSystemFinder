#!/bin/bash
read -p "enter the range ip: " rIp 
read -p "enter the number of ips: " num 
declare -a ips
rIp=$(echo $rIp | cut -d . -f 1,2,3)

for ip in $(seq 1 $num); do
    ping=$(ping -c 1 $rIp.$ip | grep "bytes from" | awk -F " " '{print $4}' | sed 's/://g')
    ips[$ip]="$ping"
done

echo ${ips[@]}

