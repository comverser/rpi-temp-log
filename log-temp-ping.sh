while [ true ]
do
    date >> log.txt
    ping -c 1 8.8.8.8 >> log.txt
    vcgencmd measure_temp >> log.txt
    sleep 5
done
