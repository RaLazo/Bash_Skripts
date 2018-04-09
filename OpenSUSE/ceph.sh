'
  ceph.sh sends data to of a ceph storagecluster to the grafana-server
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
#OSD & HEALTH - Abfrage:
stat=$(ceph -s | grep osdmap);
osd=${stat:14:1};
up=${stat:26:1};
in=${stat:32:1};
#�bertragung:
#OSD & HEALTH - status:
curl -XPOST "http://192.168.1.11:8086/write?db=osd" -d "cluster,osd=${osd},up=${up} in=${in}"
