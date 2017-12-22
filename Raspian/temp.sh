#!/bin/bash
# Dieses Skript schickt die Temp Daten eines
# Pis (Raspian) an den Grafana - Server
# Copyright by Rafael Lazenhofer
# Datum: 15.10.2017
# Engineer: Rafael Lazenhofer
# Version: 4.1
# Hier Hostname für Pi eintragen:
host='node6'

#Beginn Code:

#Temperatur:
temp=$(vcgencmd measure_temp);temp=${temp:5:4};

#Übertragung:
#Temperatur:
curl -XPOST "http://192.168.1.11:8086/write?db=temp" -d "${host} temp=${temp}"

