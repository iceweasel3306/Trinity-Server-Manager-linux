#!/bin/bash
#Server Management Script Menu
#Iceweasel development, released under GNU General Public License (see readme)

source config

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
    echo -e "${MENU}**${NUMBER} 6)${MENU}  Server Configuration(In Progress) ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7)${MENU}  Server Restarter(Background) ${NORMAL}"
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
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
           option_picked "TrinityCore Startup with service checks";
        	source config
		bash startupwsc
		show_menu;
        ;;

        2) clear;
           option_picked "TrinityCore Startup without service checks";
		source config
            	bash startup
		show_menu;
            ;;

        3) clear;
           option_picked "TrinityCore Service Checks";
		source config
        	bash svcs
		show_menu;
            ;;

        4) clear;
           option_picked "TrinityCore Account Management";
		source config
        	bash account
        	show_menu;
           ;;
	5) clear;
           option_picked "TrinityCore Account Permission Manager";
        	source config
		bash permissions
        	show_menu;
           ;;
	6) clear;
	   option_picked "Server Configuration";
	   	echo "In Progress..."
	   	bash server_cnfg
	   	show_menu;
	   ;;
	7) clear;
	   option_picked "Server Restarter (Background)";
	   	screen -dmS restarter $RPATH/restarter
	   	show_menu;
	   ;;
	8) clear;
	   option_picked "Attach to Auth Server";
	   	echo "Press Ctrl+a+d to detach from the server without shutting it down."
	   	sleep 5
	   	screen -r auth
	   	show_menu;
	   ;;
	9) clear;
	   option_picked "Attach to World Server";
	   	echo "Press Ctrl+a+d to detach from the server without shutting it down."
	   	sleep 5
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
        x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done