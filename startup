#!/bin/bash
#TrinityCore Startup without service checks
#Iceweasel development, released under GNU General Public License (see readme)

source config

echo "Starting Server Daemons without Service checks"
echo
sleep 5
clear;

if [ -p $AUTH_SCREEN ]
  then
	echo "Auth Server is already running"
  else
	echo "Starting Authserver..."
	echo
	screen -dmS auth $AUTH_LOC
fi

if [ -p $WORLD_SCREEN ]
  then
	echo "World Server is already running"
	exit 1
  else
	echo "Starting Worldserver..."
	echo
	screen -dmS world $WORLD_LOC
fi

CHECK=$(screen -list)

cd $SCREEN_LOC

echo -n "Do you to start start the restarter background process?(1(Y)/0(N)): "
read ans
if [ $ans == 1 ]
then
screen -dmS restarter $RPATH/restarter
else
echo
fi

ASTAT=$(ls *.auth)
WSTAT=$(ls *.world)
RSTAT=$(ls *.restarter)


echo -n "User ID: "
read sig
echo
echo -n "Comment: "
read com
echo

echo "$RIGHT_NOW"
echo "TrinityCore: Unix User: $USER | Time: $RIGHT_NOW | Id: $sig | Comment: $com | Status: $ASTAT : $WSTAT : $RSTAT (No service checks)" >> $START_LOG
