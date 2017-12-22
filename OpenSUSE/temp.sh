#!/bin/bash
# Dieses Skript schickt die Temp Daten eines
# Pis (OpenSUSE) an den Grafana - Server
# Copyright by Rafael Lazenhofer
# Datum: 15.10.2017
# Engineer: Rafael Lazenhofer
# Version: 4.1
# Hier Hostname für Pi eintragen:
host='node1'

#Beginn Code:
#Temperaturdaten:
temp=$(sensors);temp=${temp:61};temp=${temp:4:4};
#Übertragung:
#Temperatur:
curl -XPOST "http://192.168.1.11:8086/write?db=temp" -d "${host} temp=${temp}"
