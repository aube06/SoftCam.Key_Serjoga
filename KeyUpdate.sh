#!/bin/sh
#DESCRIPTION=This script created by Levi45 @www.sat-linux.com
###############################################################################
#KeysUpdater="http://sat-linux.com/addons/MipsMulticam/Mips/KeysUpdater.sh"
SoftcamKeys="https://raw.githubusercontent.com/aube06/SoftCam.Key_Serjoga/master"
#Constantcw="http://sat-linux.com/addons/constant.cw"
echo ""
echo ""
#echo "Downloading ${KeysUpdater}"
#wget ${KeysUpdater} -O /usr/lib/enigma2/python/Plugins/Extensions/Levi45MipsEmuKeysUpdater/KeysUpdater.sh || echo "Error: Couldn't connect to ${KeysUpdater}"
#echo ""
#chmod 775 /usr/lib/enigma2/python/Plugins/Extensions/Levi45MipsEmuKeysUpdater/KeysUpdater.sh
#echo ""
echo "Downloading ${SoftcamKeys}"
wget ${SoftcamKeys} -O /usr/keys/SoftCam.Key || echo "Error: Couldn't connect to ${SoftcamKeys}"
echo ""
echo "Downloading ${SoftcamKeys}"
wget ${SoftcamKeys} -O /etc/tuxbox/config/SoftCam.Key || echo "Error: Couldn't connect to ${SoftcamKeys}"
#echo ""
#echo "Downloading ${Constantcw}"
#wget ${Constantcw} -O /etc/tuxbox/config/constant.cw || echo "Error: Couldn't connect to ${Constantcw}"
#echo "Downloading ${Constantcw}"
#wget ${Constantcw} -O /usr/keys/constant.cw || echo "Error: Couldn't connect to ${Constantcw}"
echo ""
echo ""
echo "#########################################################"
echo "#               Levi45 @WWW.SAT-LINUX.COM               #"
echo "#########################################################"
echo "#              KEYS INSTALLED SUCCESSFULLY              #"
echo "#########################################################"
echo "#                      GUI RESTARTING                   #"
echo "#########################################################"
init 4
killall -9 enigma2 > /dev/null 2>&1
init 3
exit 0
