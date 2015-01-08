#!/bin/bash
#Backup Manager
#Iceweasel development, released under GNU General Public License (see readme)

show_menu5(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**************TrinityCore Account Permission Management**************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} *Configure Backups* ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} MySQL Backup ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} *File Backup* ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} *Full Server Backup* ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} *Auto Backup Setup* ${NORMAL}"
    echo -e "${MENU}*********************************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked5() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}
echo -n "MySQL Username: "
read umysql
echo
echo -n "MySQL Password: "
read pmysql
echo	 
clear
show_menu5
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
	1) clear;
	   option_picked5 "Configure";
	   echo "Unfinished"
	   sleep 2
	   show_menu5;
	;;
	
	2) clear;
	   option_picked5 "MySQL Backup"
	   mysqldump -u $umysql -p$pmysql --all-databases > $BPATH/mysql/full_$RIGHT_NOW.sql
	   echo "All Databases backed up, you can find your full backup file within $BPATH"
	   sleep 8 
	   show_menu5;
	x) exit
        ;;

        \n) exit;
        ;;

        *) clear;
           option_picked "Pick an option from the menu";
           show_menu3;
        ;;

    esac
fi
done