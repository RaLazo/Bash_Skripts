#!/bin/bash
# Dieses Skript schickt die CPU Daten eines
# Pis an den Grafana - Server
# Copyright by Rafael Lazenhofer
# Datum: 15.10.2017
# Engineer: Rafael Lazenhofer
# Version: 1.0
echo CPU Datatransfer Version 1.0;
echo 'Start:';
chars="/-\|"
temp=$(vcgencmd measure_temp)
#clock=$(vcgencmd measure_clock arm)
#volt=$(vcgencmd measure_volts core)
#temp=$(echo $temp | cut -d '=' -f 2)
temp=$(echo $temp |  tail -c +6|head -c 4)
#echo $clock
#echo $volt
while [ true ]
do
	for (( i=0; i<${#chars}; i++ ))
	do
    		sleep 0.5
    		echo -en "Running Process . . . . .${chars:$i:1}" "\r"
	done
	for ((j=0; j<3; j++))
	do
		echo "HAllo"
	done
done;
