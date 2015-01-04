#!/bin/bash
#In-game Account Management
#Iceweasel development, released under GNU General Public License (see readme)

source config

echo "Checking to make sure servers are running..."
echo
echo "$SCREEN_CHK"
echo
sleep 2

show_menu2(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**************TrinityCore Account Management**************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Create New User Account ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Update User Account Password ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Delete User Account ${NORMAL}"
    echo -e "${MENU}**********************************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit to main menu. ${NORMAL}"
    read opt
}

function option_picked2() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu2
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
	1)	clear;
		option_picked2 "Account Creation";
		echo -n "Username: "
		read username
		echo
		echo -n "Password: "
		read password
		clear
		echo "Review your info"
		echo "Username: $username"
		echo "Password: $password"
		read -rsp $'Press any key to continue...\n' -n1 key
		echo
		screen -S world -X -pworld stuff "account create $username $password\n"
		echo "Account Created: $username"
		   echo -n "ID: "
		   read id
		   echo -n "Comments: "
		   read com
		   echo "Account Created: $username :$password: | Unix User: $USER | ID: $id | Comments: $com | Time: $RIGHT_NOW" >> $ACC_LOG
		sleep 2
		show_menu2;
	;;
	2)	clear;
		option_picked2 "Password Update";
		echo -n "Account Username: "
		read account
		echo
		echo -n "New Password: "
		read passwd
		screen -S world -X -pworld stuff "account set password $account $passwd $passwd\n"
		echo -n "ID: "
		read id
		echo -n "Comments: "
		read com
		echo "Password Updated: $account | Unix User: $USER | ID: $id | Comments: $com | Time: $RIGHT_NOW" >> $ACC_LOG
		sleep 1
		echo "Password updated for $account"
		show_menu2;
	;;
	3)	clear;
		option_picked2 "Account Deletion (WARNING)";
		echo -n "Account Name: "
		read delacc
		echo "Please note this process will delete all data connected to the account, although the characters however will remain recoverable if you have unlink configured in worldserver.conf."
		sleep 5
		read -rsp $'Press any key to continue...\n' -n1 key
		   echo "Deleting account $delacc ..."
		   screen -S world -X -pworld stuff "account delete $delacc\n"
		   echo "Account Deleted: $delacc"
		   echo -n "ID: "
		   read id
		   echo -n "Comments: "
		   read com
		   echo "Account Deleted: $delacc | Unix User: $USER | ID: $id | Comments: $com | $RIGHT_NOW" >> $ACC_LOG
		   sleep 2
		show_menu2;
	;;
        
	x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
        option_picked2 "Pick an option from the menu";
        show_menu2;
        ;;
    esac
fi
done