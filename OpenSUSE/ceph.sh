#!/bin/bash
# Dieses Skript schickt Daten 
# eines Ceph Cluster
# an den Grafana - Server
# Copyright by Rafael Lazenhofer
# Datum: 15.10.2017
# Engineer: Rafael Lazenhofer
# Version: 4.1
# Hier Hostname für Pi eintragen:
host='node1'

#Beginn Code:
#OSD & HEALTH - Abfrage:
stat=$(ceph -s | grep osdmap);osd=${stat:17:1};up=${stat:25:1};in=${stat:31:1};
#Übertragung:
#OSD & HEALTH - status:
curl -XPOST "http://192.168.1.11:8086/write?db=osd" -d "cluster,osd=${osd},up=${up} in=${in}"
