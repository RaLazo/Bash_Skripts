'
  temp.sh sends tempreature data to a grafana-server
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
# Hier Hostname f�r Pi eintragen:
host='node1'

#Beginn Code:
#Temperaturdaten:
temp=$(sensors);temp=${temp:61};temp=${temp:4:4};
#�bertragung:
#Temperatur:
curl -XPOST "http://192.168.1.11:8086/write?db=temp" -d "${host} temp=${temp}"
