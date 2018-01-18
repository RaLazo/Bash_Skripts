# Bash Skripten
Diese Skripten sind für das auslesen eingiger Statuswerte eines
Raspberry Pi´s zuverwenden. Sie schicken die Daten an die HTTP API
der InfluxDB

Diese Skripten sind im zuge der Diplomarbeit OSS
enstand und sind speziel für den dabei verwendeten 
Ceph Cluster bestehend aus 6 Raspberry's konzipiert

> Anmerkung:
> Sie können mit ein bisschen Kenntnis in 
> Bash und Python leicht abgändert werden
# Vorbereitung

Bevor man die Skripten verwenden kann müssen ein 
paar Dinge vor installiert werden

## Unter Raspian:

Für das Auslesen der CPU & des RAM wird Pyhton benötigt  

'''
sudo apt-get install python
pip install psutil
'''
Für die Temperatur
'''
sudo apt-get install vcgencmd
'''
## Unter Opensuse:

Für die Temperatur:
'''
zypper install sensors
'''
# Daten
Man erhält folgende Daten:
Raspian | Opensuse
------------ | -------------
Temperatur | Temperatur
CPU Auslastung | Cluster Status (Ceph)
RAM Auslastung |