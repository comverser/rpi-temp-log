#!/bin/bash

timestamp=`date +%F_%H-%M-%S`
if [ ! -d /home/pi/logs ]; then
    mkdir /home/pi/logs
fi
touch /home/pi/logs/temperature_log_$timestamp.txt
echo "Temperature Log - $(date)" >/home/pi/logs/temperature_log_$timestamp.txt
while :
do
	cpuTemp0=$(cat /sys/class/thermal/thermal_zone0/temp)
	cpuTemp1=$(($cpuTemp0/1000))
	cpuTemp2=$(($cpuTemp0/100))
	cpuTempM=$(($cpuTemp2 % $cpuTemp1))

	echo $(date "+%Y-%m-%d %H:%M") Temperature CPU : $cpuTemp1"."$cpuTempM"'C" >>/home/pi/logs/temperature_log_$timestamp.txt
	# temp=`/opt/vc/bin/vcgencmd measure_temp`
	# temp=${temp:5:16}
	# echo $temp >>/home/pi/logs/temperature_log_$timestamp.txt
	sleep 10
done
