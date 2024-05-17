#!/bin/bash
read -p "enter the range ip: " rIp 
read -p "enter the number of ips: " num 
read -p "enter the number of port for scan: " numP 
declare -a ips
rIp=$(echo $rIp | cut -d . -f 1,2,3)

for ip in $(seq 1 $num); do
    ping=$(ping -c 1 $rIp.$ip | grep "bytes from" | awk -F " " '{print $4}' | sed 's/://g')
    #ips[$ip]="$ping"
    if [[  $ping != "" ]]; then
    for port in $(seq 1 $numP); do 
	    echo "" > /dev/tcp/$ping/$port && echo "Port is Open"|grep "Port is Open"
    done
    fi
done

#echo ${ips[@]}

