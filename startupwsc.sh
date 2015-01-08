#!/bin/bash
#TrinityCore Startup with Service checks
#Iceweasel development, released under GNU General Public License (see readme)

source config

echo
echo "Checking SSH and MySQL status..."

SSH=$(sudo chkconfig ssh)
MYSQL=$(sudo chkconfig mysql)
APACHE=$(sudo chkconfig apache)

echo
echo "SSH status: $SSH"
echo "MySQL status: $MYSQL"
echo "Apache status: $APACHE"
echo

if ps ax | grep -v grep | grep mysqld > /dev/null
    then
	echo "Starting Server Daemons..."
	echo
    else
	echo "MySQL is not running on localhost!"
	echo "Exiting..."
	exit 1
fi

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

echo "$CHECK"

echo -n "Do you to start start the restarter process?(Yes(1) or No(0): "
read ans
if [ $ans == 1 ]
then
    if [ ! -p $RESTARTER_SCREEN ]
    then
	screen -dmS restarter $RPATH/restarter
	echo "Restarter is now running..."
	sleep 1
    else
	echo "Restarter is already running on $RESTARTER_SCREEN"
	echo "Run kill option first if restarter is not running."
    fi
else
    echo
    echo "Restarter service was not started..."
    sleep 1
fi

cd $SCREEN_LOC
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
echo "$RIGHT_NOW: TrinityCore: Unix User: $USER | Id: $sig | Comment: $com | Status: $ASTAT : $WSTAT : $RSTAT" >> $START_LOG
sleep 2