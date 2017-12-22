#!/bin/bash
# Dieses Skript schickt die CPU Daten eines
# Pis an den Grafana - Server
# Copyright by Rafael Lazenhofer
# Datum: 15.10.2017
# Engineer: Rafael Lazenhofer
# Version: 4.1
# Hier Hostname für Pi eintragen:
host='node6'

#Beginn Code:
while [ true ]
do
#CPU DATEN
PY_COMMAND="import psutil;import numpy;print(round(numpy.array(psutil.cpu_percent(percpu=True)).mean(),1))"
#RAM Auslastung:
FREE_DATA=`free -m | grep Mem` 
CURRENT=`echo $FREE_DATA | cut -f3 -d' '`
TOTAL=`echo $FREE_DATA | cut -f2 -d' '`
ram=$(echo "scale = 2; $CURRENT/$TOTAL*100" | bc)
#Für Raspian entkommentieren:
temp=$(vcgencmd measure_temp);temp=${temp:5:4};

#CPU Auslastung:
cpu=$( python -c "${PY_COMMAND}" )

#Übertragung:
#CPU Auslastung:
curl -XPOST "http://192.168.1.11:8086/write?db=cpu" -d "${host} cpu=${cpu}"
#RAM Auslastung:
curl -XPOST "http://192.168.1.11:8086/write?db=ram" -d "${host} ram=${ram}"
sleep 5
done;
