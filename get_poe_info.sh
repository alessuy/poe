#! /bin/sh

path="/var/www/html/poe"

COMUNIDAD=""

function get_info() {
	snmpwalk -c $COMUNIDAD -v2c $1 1.3.6.1.2.1.105.1.3.1.1.4 | awk '{SUM += $4} END { print SUM}'
}

function updatedb() {
#1ro chequear si existe la base luego crear si es necesiario  y actualizar
              ini=$(date +%s)
	
	if  ! [ -f $path/bds/$1.rrd ]
           then
              rrdtool create  $path/bds/$1.rrd --start $ini --step 300 DS:pw:GAUGE:600:0:U \
              RRA:AVERAGE:0.5:1:600 \
              RRA:AVERAGE:0.5:6:700 \
              RRA:AVERAGE:0.5:24:775 \
              RRA:AVERAGE:0.5:288:797 \
              RRA:MAX:0.5:1:600 \
              RRA:MAX:0.5:6:700 \
              RRA:MAX:0.5:24:775 \
              RRA:MAX:0.5:288:797 \
              RRA:MIN:0.5:1:600 \
              RRA:MIN:0.5:6:700 \
              RRA:MIN:0.5:24:775  \
              RRA:MIN:0.5:288:797
	   echo "no existe"	
	   sleep 2
	fi
	
	rrdtool update $path/bds/$1.rrd $ini:$2

}

echo $(date) > $path/log.log

for dev in $(cat $path/devices)
do

poe_w=$(get_info $dev)
updatedb $dev $poe_w
echo $dev $poe_w >> $path/log.log
done

