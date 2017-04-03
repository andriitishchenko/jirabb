#!/bin/bash
#
# Usage icomake src.png

x2=1 #generate @2x. ?
dpi=72 # default dpi

echo "SRC: "
sips -g dpiHeight -g dpiWidth $1
#sizes=(16 19 48 128)
sizes=(512 256 128 64 32 16)
iconset="${1%.*}".iconset

rm -rf $iconset
rm -f $iconset.icns

echo "CREATE: " $iconset
mkdir -p $iconset

i=0
while [ $i -lt ${#sizes[@]} ]; do
base=icon_${sizes[$i]}
echo "- " $base
cp $1 $iconset/$base.png
sips -z ${sizes[$i]} ${sizes[$i]} -s dpiHeight $dpi -s dpiWidth $dpi $iconset/$base.png &>/dev/null
if [ $x2 -ne 0 ]; then
cp $1 $iconset/$base@2x.png
#sips -z ${sizes[$i]} ${sizes[$i]} -s dpiHeight $(( $dpi * 2 )) -s dpiWidth $(( $dpi * 2 )) $iconset/$base@2x.png &>/dev/null
sips -z $(( ${sizes[$i]} * 2)) -z $(( ${sizes[$i]} * 2)) -s dpiHeight $dpi -s dpiWidth $dpi $iconset/$base@2x.png &>/dev/null
fi
: $[ i++ ]
done
iconutil -c icns ./$iconset
echo "DONE: " $iconset

