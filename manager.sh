#!/bin/bash
#Server Management Script Menu
#Iceweasel development, released under GNU General Public License (see readme)

source config

if [ $FIRST_START == 1 ]
    then
	mawk '{gsub("FIRST_START=1", "FIRST_START=0"); print }' config > config1
	mv config $CONF/config2
	mv config1 $CONF/config
	rm config2
	echo "First start: $FIRST_START"
	echo "Use configuration manager to configure the tools to your system."
	echo "The Server Manager is configured with its location expected within the same directory of your server files, but isn't too hard to reconfigure (see file config)"
	echo "I'll have the configuration manager able to do that soon, right now it can configure the Server Manager for your server setup, binary"
	echo "default for server files directory name is /server/"
	echo "default for binaries is /server/bin/"
	echo "default path for server files is /$HOME/server/"
	sleep 1
	echo
	echo
	echo "TrinityCore Server Manager 0.7 BETA"
	echo "Developer(s): iceweasel3306"
	echo
	echo "Press any key to continue..."
	sed -n q </dev/tty
	clear
	echo "   This program is free software; you can redistribute it and/or modify"
	echo "   it under the terms of the GNU General Public License as published by"
	echo "   the Free Software Foundation; either version 2 of the License, or"
	echo "   (at your option) any later version."
	echo
	echo "   This program is distributed in the hope that it will be useful,"
	echo "   but WITHOUT ANY WARRANTY; without even the implied warranty of"
	echo "   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
	echo "   GNU General Public License for more details."
	echo
	echo "   You should have received a copy of the GNU General Public License along"
	echo "   with this program; if not, write to the Free Software Foundation, Inc.,"
	echo "   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA."
	sleep 3
	clear
    else
	echo "Server Manager 0.7 BETA"
	echo "Developer(s): iceweasel3306"
	echo "Copyright (c)2015 Iceweasel3306"
	echo "License: Public GNU 2.0"
	sleep 2
fi
show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**************TrinityCore Server Management**************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU}  Start Trinity with service checks ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU}  Start Trinity without service checks ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU}  Service Checks ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU}  Account Manager ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU}  Account Permission Manager ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6)${MENU}  Configuration Manager(In progress) ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7)${MENU}  Server Restarter - start/kill service ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 8)${MENU}  Attach to Auth Screen ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 9)${MENU}  Attach to World Screen ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 10)${MENU} MySQL Command Line ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 11)${MENU} Backup Manager(TODO) ${NORMAL}"
    echo -e "${MENU}*********************************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; 
    then 
    	exit;
    else
        case $opt in
        1) clear;
           option_picked "TrinityCore Startup with service checks";
        	source config
		bash startupwsc.sh
		show_menu;
        ;;

        2) clear;
           option_picked "TrinityCore Startup without service checks";
		source config
            	bash startup.sh
		show_menu;
        ;;

        3) clear;
           option_picked "TrinityCore Service Checks";
		source config
        	bash svcs.sh
		show_menu;
        ;;

        4) clear;
           option_picked "TrinityCore Account Management";
		source config
        	bash account.sh
        	show_menu;
        ;;
	
	5) clear;
           option_picked "TrinityCore Account Permission Manager";
        	source config
		bash permissions.sh
        	show_menu;
        ;;

	6) clear;
	   option_picked "Server Configuration";
	   	echo "In Progress..."
	   	bash server_cnfg.sh
	   	show_menu;
	;;
	
	7) clear;
	   option_picked "Server Restarter Service";
		echo -n "Start(1) or kill(0): "
		read ans
		    if [ $ans == 1 ]
		    then
			clear
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
			killall -9 $WORLD
			screen -S world -X kill &>/dev/null
			screen -wipe world
			echo "Restarter service killed..."
		   	sleep 1
		    fi
	   	show_menu;
	;;

	8) clear;
	   option_picked "Attach to Auth Server";
		echo "Press Ctrl+a+d to detach from the server without shutting it down."
		echo "Attaching to Auth screen..."
	   	sleep 3
	   	screen -r auth
	   	show_menu;
	;;

	9) clear;
	   option_picked "Attach to World Server";
	   	echo "Press Ctrl+a+d to detach from the server without shutting it down."
		echo "Attaching to World screen..."
	   	sleep 3
	   	screen -r world
	   	show_menu;
	;;

	10) clear;
	    option_picked "MySQL Command Line";
	    	echo "Press Ctrl+c to exit the command line."
	    	sleep 4
	    	clear
	    	echo -n "MySQL Username: "
	    	read username
	    	echo -n "MySQL Password: "
	    	read password
		clear
	    	mysql -u $username -p$password
	    	show_menu;
	;;
	
	11) clear;
	    option_picked "Backup Manager (In progress)"
	    bash backup.sh
	    show_menu;
	;;

        x) exit;
        ;;

        \n) exit;
        ;;

        *)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;

    esac
    fi
done