#! /bin/bash
rIp=$1
num=$2
rIp=`echo $rIp | cut -d . -f 1,2,3  `
for ip in $(seq $num );do
#	ping -c 1  192.168.1.$ip | grep "bytes from" | cut -d " " -d
	ping -c 1  $rIp.$ip | grep "bytes from"| awk -F " " '{print $4}' 
	#echo $rIp
done
