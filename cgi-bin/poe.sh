#! /bin/sh

echo "Content-type: text/html;charset=ISO-8859"
echo ""

echo "<html><head><META HTTP-EQUIV=\"refresh\" CONTENT=\"60\"></head><body>"
web="/poe"
bd="/var/www/html/poe/bds"
img="/var/www/html/poe/img"

graficaspoe(){
#$1 tiempo
        rrdtool graph  $img/poe.png  \
        --imgformat PNG \
        --start now-$1  \
        --end now \
        -l 0 \
        --title "Potencia Consumida"  \
        --vertical-label "W" \
        --height 250 \
        --width 600 \
        --color ARROW#0000FF \
        -W "www.bse.com.uy" \
	DEF:bl-pb=$bd/sw-bl-pba.rrd:pw:AVERAGE \
	DEF:bl-p1=$bd/sw-bl-p1a.rrd:pw:AVERAGE \
	DEF:bl-p2=$bd/sw-bl-p2a.rrd:pw:AVERAGE \
	DEF:bl-cam=$bd/sw-bl-cam.rrd:pw:AVERAGE \
	DEF:bl-p5=$bd/sw-bl-p5a.rrd:pw:AVERAGE \
        DEF:bl-p12=$bd/sw-bl-p12a.rrd:pw:AVERAGE \
	DEF:bl-p13=$bd/sw-bl-p13a.rrd:pw:AVERAGE \
        DEF:bl-p14=$bd/sw-bl-p14a.rrd:pw:AVERAGE \
	DEF:bb-pp=$bd/sw-bb-ppa.rrd:pw:AVERAGE \
	DEF:bb-pb=$bd/sw-bb-pba.rrd:pw:AVERAGE \
	DEF:bb-p1=$bd/sw-bb-p1a.rrd:pw:AVERAGE \
        DEF:bb-t01=$bd/sw-bb-t01.rrd:pw:AVERAGE \
        DEF:bb-p2=$bd/sw-bb-p2a.rrd:pw:AVERAGE \
        DEF:bb-p3=$bd/sw-bb-p3a.rrd:pw:AVERAGE \
        DEF:hb-n0a=$bd/sw-hb-n0a.rrd:pw:AVERAGE \
        DEF:hb-n0b=$bd/sw-hb-n0b.rrd:pw:AVERAGE \
	DEF:hb-n0c=$bd/sw-hb-n0c.rrd:pw:AVERAGE \
        DEF:hb-n1a=$bd/sw-hb-n1a.rrd:pw:AVERAGE \
        DEF:hb-n1b=$bd/sw-hb-n1b.rrd:pw:AVERAGE \
	DEF:hb-n1c=$bd/sw-hb-n1c.rrd:pw:AVERAGE \
        DEF:hb-n2a=$bd/sw-hb-n2a.rrd:pw:AVERAGE \
        DEF:hb-n2b=$bd/sw-hb-n2b.rrd:pw:AVERAGE \
	DEF:hb-n2c=$bd/sw-hb-n2c.rrd:pw:AVERAGE \
        DEF:hb-n3a=$bd/sw-hb-n3a.rrd:pw:AVERAGE \
        DEF:hb-n3b=$bd/sw-hb-n3b.rrd:pw:AVERAGE \
	DEF:hb-n3c=$bd/sw-hb-n3c.rrd:pw:AVERAGE \
        DEF:hb-n4a=$bd/sw-hb-n4a.rrd:pw:AVERAGE \
        DEF:hb-n4b=$bd/sw-hb-n4b.rrd:pw:AVERAGE \
	DEF:hb-n4c=$bd/sw-hb-n4c.rrd:pw:AVERAGE \
        DEF:hb-n5a=$bd/sw-hb-n5a.rrd:pw:AVERAGE \
        DEF:hb-n5b=$bd/sw-hb-n5b.rrd:pw:AVERAGE \
	DEF:hb-n5c=$bd/sw-hb-n5c.rrd:pw:AVERAGE \
	DEF:cc-p8=$bd/sw-tel-cc-p8a.rrd:pw:AVERAGE \
	COMMENT:"             ACTUAL    MAXIMO \n" \
	COMMENT:"---------------------------------------------------------------------------------------\n" \
        AREA:bl-pb#CA6F1E:"SW-BL-PBA " \
        GPRINT:bl-pb:LAST:"%5.0lf" \
        GPRINT:bl-pb:MAX:"%5.0lf \n" \
        STACK:bl-p1#CA6F1E:"SW-BL-P1A " \
        GPRINT:bl-p1:LAST:"%5.0lf " \
	GPRINT:bl-p1:MAX:"%5.0lf \n" \
	STACK:bl-cam#CA6F1E:"SW-BL-CAM " \
        GPRINT:bl-cam:LAST:"%5.0lf " \
        GPRINT:bl-cam:MAX:"%5.0lf\n" \
	STACK:bl-p2#CA6F1E:"SW-BL-P2A " \
	GPRINT:bl-p2:LAST:"%5.0lf " \
	GPRINT:bl-p2:MAX:"%5.0lf \n" \
 	STACK:bl-p5#CA6F1E:"SW-BL-P5A " \
        GPRINT:bl-p5:LAST:"%5.0lf " \
        GPRINT:bl-p5:MAX:"%5.0lf \n" \
	STACK:bl-p12#CA6F1E:"SW-BL-P12A" \
        GPRINT:bl-p12:LAST:"%5.0lf " \
        GPRINT:bl-p12:MAX:"%5.0lf \n" \
	STACK:bl-p13#CA6F1E:"SW-BL-P13A" \
        GPRINT:bl-p13:LAST:"%5.0lf " \
        GPRINT:bl-p13:MAX:"%5.0lf \n" \
	STACK:bl-p14#CA6F1E:"SW-BL-P14A" \
        GPRINT:bl-p14:LAST:"%5.0lf " \
        GPRINT:bl-p14:MAX:"%5.0lf \n" \
	COMMENT:"---------------------------------------------------------------------------------------\n" \
	STACK:bb-pp#FFFF00:"SW-BB-PPA " \
        GPRINT:bb-pb:LAST:"%5.0lf" \
        GPRINT:bb-pb:MAX:"%5.0lf \n" \
	STACK:bb-pb#FFFF00:"SW-BB-PBA " \
        GPRINT:bb-pb:LAST:"%5.0lf" \
        GPRINT:bb-pb:MAX:"%5.0lf \n" \
	STACK:bb-p1#FFFF00:"SW-BB-P1A " \
        GPRINT:bb-p1:LAST:"%5.0lf" \
        GPRINT:bb-p1:MAX:"%5.0lf \n" \
	STACK:bb-p2#FFFF00:"SW-BB-P2A " \
        GPRINT:bb-p2:LAST:"%5.0lf" \
        GPRINT:bb-p2:MAX:"%5.0lf \n" \
	STACK:bb-p3#FFFF00:"SW-BB-P3A " \
        GPRINT:bb-p3:LAST:"%5.0lf " \
        GPRINT:bb-p3:MAX:"%5.0lf \n" \
	STACK:bb-t01#FFFF00:"SW-BB-T01" \
        GPRINT:bb-t01:LAST:"%5.0lf " \
        GPRINT:bb-t01:MAX:"%5.0lf \n" \
	COMMENT:"---------------------------------------------------------------------------------------\n" \
	STACK:hb-n0a#1ABC9C:"SW-HB-N0A " \
        GPRINT:hb-n0a:LAST:"%5.0lf " \
        GPRINT:hb-n0a:MAX:"%5.0lf \n" \
        STACK:hb-n0b#1ABC9C:"SW-HB-N0B " \
        GPRINT:hb-n0b:LAST:"%5.0lf " \
        GPRINT:hb-n0b:MAX:"%5.0lf \n" \
        STACK:hb-n0c#1ABC9C:"SW-HB-N0C " \
        GPRINT:hb-n0c:LAST:"%5.0lf " \
        GPRINT:hb-n0c:MAX:"%5.0lf \n" \
        STACK:hb-n1a#1ABC9C:"SW-HB-N1A " \
        GPRINT:hb-n1a:LAST:"%5.0lf " \
        GPRINT:hb-n1a:MAX:"%5.0lf \n" \
        STACK:hb-n1b#1ABC9C:"SW-HB-N1B " \
        GPRINT:hb-n1b:LAST:"%5.0lf " \
        GPRINT:hb-n1b:MAX:"%5.0lf \n" \
        STACK:hb-n1c#1ABC9C:"SW-HB-N1C " \
        GPRINT:hb-n1c:LAST:"%5.0lf " \
        GPRINT:hb-n1c:MAX:"%5.0lf \n" \
        STACK:hb-n2a#1ABC9C:"SW-HB-N2A " \
        GPRINT:hb-n2a:LAST:"%5.0lf " \
        GPRINT:hb-n2a:MAX:"%5.0lf \n" \
        STACK:hb-n2b#1ABC9C:"SW-HB-N2B " \
        GPRINT:hb-n2b:LAST:"%5.0lf " \
        GPRINT:hb-n2b:MAX:"%5.0lf \n" \
        STACK:hb-n2c#1ABC9C:"SW-HB-N2C " \
        GPRINT:hb-n2c:LAST:"%5.0lf " \
        GPRINT:hb-n2c:MAX:"%5.0lf \n" \
        STACK:hb-n3a#1ABC9C:"SW-HB-N3A " \
        GPRINT:hb-n3a:LAST:"%5.0lf " \
        GPRINT:hb-n3a:MAX:"%5.0lf \n" \
        STACK:hb-n3b#1ABC9C:"SW-HB-N3B " \
        GPRINT:hb-n3b:LAST:"%5.0lf " \
        GPRINT:hb-n3b:MAX:"%5.0lf \n" \
        STACK:hb-n3c#1ABC9C:"SW-HB-N3C " \
        GPRINT:hb-n3c:LAST:"%5.0lf " \
        GPRINT:hb-n3c:MAX:"%5.0lf \n" \
        STACK:hb-n4a#1ABC9C:"SW-HB-N4A " \
        GPRINT:hb-n4a:LAST:"%5.0lf " \
        GPRINT:hb-n4a:MAX:"%5.0lf \n" \
        STACK:hb-n4b#1ABC9C:"SW-HB-N4B " \
        GPRINT:hb-n4b:LAST:"%5.0lf " \
        GPRINT:hb-n4b:MAX:"%5.0lf \n" \
        STACK:hb-n4c#1ABC9C:"SW-HB-N4c " \
        GPRINT:hb-n4c:LAST:"%5.0lf " \
        GPRINT:hb-n4c:MAX:"%5.0lf \n" \
        STACK:hb-n5a#1ABC9C:"SW-HB-N5A " \
        GPRINT:hb-n5a:LAST:"%5.0lf " \
        GPRINT:hb-n5a:MAX:"%5.0lf \n" \
        STACK:hb-n5b#1ABC9C:"SW-HB-N5B " \
        GPRINT:hb-n5b:LAST:"%5.0lf " \
        GPRINT:hb-n5b:MAX:"%5.0lf \n" \
        STACK:hb-n5c#1ABC9C:"SW-HB-N5C " \
        GPRINT:hb-n5c:LAST:"%5.0lf " \
        GPRINT:hb-n5c:MAX:"%5.0lf \n" \
	COMMENT:"---------------------------------------------------------------------------------------\n" \
 	STACK:cc-p8#00FA00:"SW-TEL-CC-P8A" \
        GPRINT:cc-p8:LAST:"%5.0lf " \
        GPRINT:cc-p8:MAX:"%5.0lf \n" > /dev/null

}


graficaspoe $1

echo "<div align=center><img src=$web/img/poe.png></div><br><br></body></html>"

exit 0
