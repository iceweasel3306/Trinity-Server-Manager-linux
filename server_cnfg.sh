#!/bin/bash
#Quick Server config
#Iceweasel development, released under GNU General Public License (see readme)

show_menu4(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**************Server Configuration**************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Configure Server Manager ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Initial Auth and World Configuration(In Progress) ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Configure Realm IP ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} ------------------------- ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} ------------------------- ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6)${MENU} ------------------------- ${NORMAL}"
    echo -e "${MENU}*********************************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked4() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu4
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; 
    then 
	exit;
    else
        case $opt in
	1) clear;
	   option_picked4 "Server Files Directory Configuration";
	   cp 
	   echo "Server files directory name"
	   echo "Put the name of the directory without / marks on either side"
	   echo -n "Press 1 for default /server/"
	   read server_dir
	   if [ ! $server_dir == 1 ]
    	   then
	   	echo "$server_dir"
	   	sleep 1
	   	sed -i "7i SERVER_DIR="\"$server_dir\""" config
	   	mawk '{gsub("/server/", "/$SERVER_DIR/"); gsub("/server", "/$SERVER_DIR"); print}' config > config1
	   	mv config $CONF/config2
	   	mv config1 $CONF/config
	   	rm config2
	   	echo "$server_dir sucessfully written to config."
	   	sleep 2
	   else
	   	echo "Using default /server/"
	   	sleep 1
	   fi

	   clear;
	   option_picked4 "Server Binary Directory Configuration";
	   echo "Server binaries directory name"
	   echo "Put the name of the directory without / marks on either side"
	   echo -n "Press 1 for default /bin/: "
	   read bin_dir
	   if [ ! $bin_dir == 1 ]
	   then
	   	echo "$bin_dir"
	   	sleep 1
	   	sed -i "6i BIN_DIR="\"$bin_dir\""" config
	   	mawk '{gsub("/bin/", "/$BIN_DIR/"); gsub("/bin", "/$BIN_DIR"); print}' config > config1
	   	mv config $CONF/config3
	   	mv config1 $CONF/config
	   	rm config 3
	   	echo "$bin_dir was sucessfully written to config."
	   	sleep 2
	   else
	   	echo "Using default /bin"
	   	sleep 1
	   fi

	   clear;
	   selected_option "Server Config File Directory";
	   clear
	   echo "Server Config Files Directory name"
	   echo "Put the name of the directory without / marks on either side"
	   echo -n "press 1 for default /etc/: "
	   read confi
	   if [ ! $confi == 1 ]
	   then
	   	echo "$confi"
	   	sleep 1
	   	mawk -v confi="$confi" '{gsub("/etc", confi); print}' config > config1
	   	mv config $CONF/config2
	   	mv config1 $CONF/config
	   	rm $CONF/config2
	   	echo "$confi was sucessfully written to config."
	   	sleep 2
	   else
   	   	echo "Using default /etc/"
	   	sleep 1
	   fi
	   show_menu4;
	;;

	2) clear;
	   option_selected4 "Auth and Config Setup";
	   echo "Empty... I'm working on it..."
	   Myline1=$(sed -n '2p' $CONFIGS/$AUTH_CONFIG)
	   show_menu4;
	;;
	
	3) clear;
	   option_picked "Realm IP Config";
	   echo -n "MySQL Username: "
	   read umysql
	   echo
	   echo -n "MySQL Password: "
	   read pmysql
	   echo
	   clear
	   echo -n "Realm name: "
	   read realm
	   echo -n "IP Address: "
	   read ipadd
	   mysql -u $umysql -p$pmysql --execute="UPDATE `realmlist` SET `address`="$ipadd" WHERE `name`="realm"" auth
	   show_menu4;
	;;

        x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
        option_picked "Pick an option from the menu";
        show_menu4;
        ;;
    esac
fi
done