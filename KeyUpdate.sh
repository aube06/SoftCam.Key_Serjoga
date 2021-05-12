#!/bin/bash
################################################################
# Title:.......KeyUpdate                                       #
# Author:......2021                                            #
# Support:.....www.dreamosat-forum.com                         #
# E-Mail:......admin@dreamosat-forum.com                       #
# Date:........26.11.2018                                      #
# Description:.KeyUpdate                                       #
################################################################
FIN="==================================================";
echo $FIN;
echo ".....:: LÜTFEN BEKLEYiNiZ .... PLEASE WAIT ::.....";
##################################################
URL="https://raw.githubusercontent.com/aube06/SoftCam.Key_Serjoga/master";
# Files
TMP=`mktemp -d`
cd ${TMP}
[ -d /usr/lib/enigma2/python/Plugins/Extensions/TURKvod/ ] || mkdir -p /usr/lib/enigma2/python/Plugins/Extensions/TURKvod/;
[ -d /usr/keys ] || mkdir -p /usr/keys;
# Github
#agent="--header='User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/600.1.17 (KHTML, like Gecko) Version/8.0 Safari/600.1.17'"
#crt="--no-check-certificate"

#wget -q $crt $agent $URL/SoftCam.Key
curl -s -Lbk -m 4 -m 6 ${URL}/TURKvodLokal.xml -o TURKvodLokal.xml
# check TURKvodLokalxml
if [ -f ${TMP}/TURKvodLokal.xml ] ; then
  #
  chmod 0600 ${TMP}/TURKvodLokal.xml -R;
  # check
  if [ -f /usr/lib/enigma2/python/Plugins/Extensions/TURKvod/TURKvodLokal.xml ] ; then
    check="/usr/lib/enigma2/python/Plugins/Extensions/TURKvod/TURKvodLokal.xml";
  elif [ -f /usr/lib/enigma2/python/Plugins/Extensions/TURKvod/TURKvodLokal.xml ] ; then
    check="/usr/lib/enigma2/python/Plugins/Extensions/TURKvod/TURKvodLokal.xml";
  elif [ -f /usr/lib/enigma2/python/Plugins/Extensions/TURKvod/TURKvodLokal.xml ] ; then
    check="/usr/lib/enigma2/python/Plugins/Extensions/TURKvod/TURKvodLokal.xml";
  else
    echo "The SoftCam.Key file was not found.\n";
    echo "It was sent to the following folder."
    echo ": /usr/lib/enigma2/python/Plugins/Extensions/TURKvod/"
    echo ": /usr/keys/"
    check="/usr/lib/enigma2/python/Plugins/Extensions/TURKvod/TURKvodLokal.xml";
  #  exit 0;
  fi;
  # copy
  cp -rd ${TMP}/SoftCam.Key $check;
  wget $crt $agent --quiet -O - $URL/README.md | grep -B100 -ia 'enigma2-plugin-extensions-KeyUpdate' | sed -e 's/<[^>]*>//g' | grep -va ".deb" | grep -va ".ipk";
 # curl -Lk -s -m 4 -m 6 ${URL}/README.md | grep -B100 -ia 'enigma2-plugin-extensions-KeyUpdate' | sed -e 's/<[^>]*>//g' | grep -va ".deb" | grep -va ".ipk";
else
  echo "";
  echo "Failed to download SoftCam.Key file !!!"
  echo "SoftCam.Key dosyası indirilemedi !!!"
  echo "";
  rm -rf ${TMP} > /dev/null;
  exit 0;
fi
echo "SoftCam.Key file sent. $check;";
echo "";
echo "SoftCam.Key updated. Do not forget to restart the EMU. good looking ...";
echo "";
echo "::: ************************* :::";
echo "Support: www.dreamosat-forum.com ";
echo $FIN
rm -rf ${TMP} > /dev/null;
exit 0
