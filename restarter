#!/bin/bash
#Server Restarter
#Iceweasel development, released under GNU General Public License (see readme)

source config

while :
    do
	sleep 15
	if [ ! -p $WORLD_SCREEN ]
	   then
	      	echo "World server crashed, now restarting."
		gdb $WPATH/$WORLD --batch -x gdbcommands | tee current
		mv current $CRASH_LOG &>/dev/null
		echo
		killall -9 $WORLD
		screen -S world -X kill &>/dev/null
		screen -wipe world
		echo "$RIGHT_NOW: $WORLD | Crashlog: $CRASH_LOG.world" | tee -a $RESTART_LOG
	      	screen -dmS world $WORLD_LOC
		echo
		sleep 1
	   else
		echo
	fi
	if [ ! -p $AUTH_SCREEN ]
	   then
		echo "Auth Server crashed, restarting now."
	   	gdb $APATH/$AUTH --batch -x gdbcommands | tee current
		mv current $CRASH_LOG.auth &>/dev/null
		echo
		killall -9 $AUTH
		screen -S auth -X kill &>/dev/null
		screen -wipe auth
		echo
		echo "$RIGHT_NOW: $AUTH | Crashlog: $CRASH_LOG.auth" | tee -a $RESTART_LOG
	   	screen -dmS auth $AUTH_LOC
		echo
		sleep 1
	   else
		echo
		sleep 30
		
	fi
    done