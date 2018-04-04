'
  cpu.sh sends RAM and CPU data to a grafana-server
    Copyright (C) 2017  Rafael Lazenhofer

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
'
#!/bin/bash
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
