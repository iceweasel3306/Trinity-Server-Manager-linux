#!/bin/bash
#TrinityCore Account Permissioning
#Iceweasel development, released under GNU General Public License (see readme)

source config

echo "Checking Server Status..."
echo
echo "$SCREEN_CHK"
echo
sleep 2

show_menu3(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**************TrinityCore Account Permission Management**************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Trial GM ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} GM ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Head GM ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} Administrator ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} Head Administrator ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6)${MENU} Owner Permissions/Commands ${RED_TEXT}(WARNING) ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7)${MENU} Staff Accounts ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 8)${MENU} Full Rights Purge ${RED_TEXT}(WARNING) ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 9)${MENU} *Custom Permission* ${NORMAL}"
    echo -e "${MENU}*********************************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked3() {
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
show_menu3
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
	1) clear;
	   option_picked3 "Trial GM Permissions and Commands";
	   ACCESS="Trial GM"

	   echo -n "Account Name: "
	   read acc
	   echo 
	   echo -n "Realm ID (-1 for all): "
	   read realm
	   echo
	   echo "You are about to promote $acc to TRIAL GM with access level: 1 on the following realm ID(s): $realm"
	   echo
	   read -rsp $'Press any key to continue...\n' -n1 key
		echo
		mysql -u $umysql -p$pmysql auth <<EOFMYSQL
		INSERT INTO account_access ( id, gmlevel, RealmID )
		SELECT account.id, 1, $realm
		FROM account
		WHERE account.username = '$username';
		EOFMYSQL
		screen -S world -X -pworld stuff "rbac account grant $acc 194 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 198 $realm\n"
	   echo
	   echo "$acc promoted to trial GM"
	   echo -n "ID: "
	   read id
	   echo -n "Comments: "
	   read com
	   echo "Promoted $acc to $ACCESS..."
	   echo "$RIGHT_NOW: Account: $acc | Access: $ACCESS | Unix User: $USER | ID: $id | Comments: $com" >> $PERM_LOG
	   sleep 4
	   show_menu3;
	;;

	2) clear;
	   option_picked3 "Regular GM Permissions and Commands";
	   ACCESS="GM"

	   echo -n "Account Name: "
	   read acc
	   echo 
	   echo -n "Realm ID (-1 for all): "
	   read realm
	   echo
	   echo "You are about to promote $acc to GM with access level: 2 on the following realm ID(s): $realm"
	   echo
	   read -rsp $'Press any key to continue...\n' -n1 key
		echo
		mysql -u $umysql -p$pmysql auth <<EOFMYSQL
		INSERT INTO account_access ( id, gmlevel, RealmID )
		SELECT account.id, 2, $realm
		FROM account
		WHERE account.username = '$username';
		EOFMYSQL
		screen -S world -X -pworld stuff "rbac account grant $acc 194 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 198 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 193 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 197 $realm\n"
	   echo -n "ID: "
	   read id
	   echo -n "Comments: "
	   read com
	   echo "Promoted $acc to $ACCESS..."
	   echo "$RIGHT_NOW: Account: $acc | Access: $ACCESS | Unix User: $USER | ID: $id | Comments: $com" >> $PERM_LOG
	   sleep 4
	   show_menu3;
	;;

	3) clear;
	   option_picked3 "Head GM Permissions and Commands";
	   ACCESS="Head GM"
		
	   echo -n "Account Name: "
	   read acc
	   echo 
	   echo -n "Realm ID (-1 for all): "
	   read realm
	   echo
	   echo "You are about to promote $acc to HEAD GM with access level: 3 on the following realm ID(s): $realm"
	   echo
	   read -rsp $'Press any key to continue...\n' -n1 key
		echo
		mysql -u $umysql -p$pmysql auth <<EOFMYSQL
		INSERT INTO account_access ( id, gmlevel, RealmID )
		SELECT account.id, 3, $realm
		FROM account
		WHERE account.username = '$username';
		EOFMYSQL
		screen -S world -X -pworld stuff "rbac account grant $acc 194 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 198 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 193 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 197 $realm\n"
	   echo -n "ID: "
	   read id
	   echo -n "Comments: "
	   read com
	   echo "Promoted $acc to $ACCESS..."
	   echo "$RIGHT_NOW: Account: $acc | Access: $ACCESS | Unix User: $USER | ID: $id | Comments: $com" >> $PERM_LOG
	   sleep 4
	   show_menu3;
	;;

	4) clear;
	   option_picked3 "Admin Permissions and Commands";
	   ACCESS="Admin"

	   echo -n "Account Name: "
	   read acc
	   echo 
	   echo -n "Realm ID (-1 for all): "
	   read realm
	   echo
	   echo "You are about to promote $acc to ADMIN with access level: 4 on the following realm ID(s): $realm"
	   echo
	   read -rsp $'Press any key to continue...\n' -n1 key
		echo
		mysql -u $umysql -p$pmysql auth <<EOFMYSQL
		INSERT INTO account_access ( id, gmlevel, RealmID )
		SELECT account.id, 4, $realm
		FROM account
		WHERE account.username = '$username';
		EOFMYSQL
		screen -S world -X -pworld stuff "rbac account grant $acc 194 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 198 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 193 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 197 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 192 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 196 $realm\n"
	   echo -n "ID: "
	   read id
	   echo -n "Comments: "
	   read com
	   echo "Promoted $acc to $ACCESS..."
	   echo "$RIGHT_NOW: Account: $acc | Access: $ACCESS | Unix User: $USER | ID: $id | Comments: $com" >> $PERM_LOG
	   sleep 4
	   show_menu3;
	;;

	5) clear;
	   option_picked3 "Head Admin Permissions and Commands";
	   ACCESS="Head Admin"

	   echo -n "Account Name: "
	   read acc
	   echo 
	   echo -n "Realm ID (-1 for all): "
	   read realm
	   echo
	   echo "You are about to promote $acc to HEAD ADMIN with access level: 5 on the following realm ID(s): $realm"
	   echo
	   read -rsp $'Press any key to continue...\n' -n1 key
		echo
		mysql -u $umysql -p$pmysql auth <<EOFMYSQL
		INSERT INTO account_access ( id, gmlevel, RealmID )
		SELECT account.id, 5, $realm
		FROM account
		WHERE account.username = '$username';
		EOFMYSQL
		screen -S world -X -pworld stuff "rbac account grant $acc 194 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 198 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 193 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 197 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 192 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 196 $realm\n"
	   echo -n "ID: "
	   read id
	   echo -n "Comments: "
	   read com
	   echo "Promoted $acc to $ACCESS..."
	   echo "$RIGHT_NOW: Account: $acc | Access: $ACCESS | Unix User: $USER | ID: $id | Comments: $com" >> $PERM_LOG
	   sleep 4
	   show_menu3;
	;;

	6) clear;
	   option_picked3 "Owner Permissions and Commands";
	   ACCESS="Owner"

	   echo -n "Account Name: "
	   read acc
	   echo 
	   echo -n "Realm ID (-1 for all): "
	   read realm
	   echo
	   echo "You are about to promote $acc to OWNER with access level: 6 on the following realm ID(s): $realm"
	   echo
	   read -rsp $'Press any key to continue...\n' -n1 key
		echo
		mysql -u $umysql -p$pmysql auth <<EOFMYSQL
		INSERT INTO account_access ( id, gmlevel, RealmID )
		SELECT account.id, 6, $realm
		FROM account
		WHERE account.username = '$username';
		EOFMYSQL
		screen -S world -X -pworld stuff "rbac account grant $acc 194 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 198 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 193 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 197 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 192 $realm\n"
		screen -S world -X -pworld stuff "rbac account grant $acc 196 $realm\n"
	   echo -n "ID: "
	   read id
	   echo -n "Comments: "
	   read com
	   echo "Promoted $acc to $ACCESS..."
	   echo "$RIGHT_NOW: Account: $acc | Access: $ACCESS | Unix User: $USER | ID: $id | Comments: $com" >> $PERM_LOG
	   sleep 4
	   show_menu3;
	;;
	
	7) clear;
	   option_picked3 "Staff Accounts";
	   mysql -u $umysql -p$pmysql auth <<EOFMYSQL
	   SELECT account_access.id, account_access.gmlevel, 
	   (SELECT username FROM account WHERE account.id=account_access.id) AS username  
	   FROM account_access WHERE gmlevel > 0;
	   EOFMYSQL
	   echo
	   read -rsp $'Press any key to continue...\n' -n1 key
	   show_menu;
	;;

	8) clear;
	   option_picked3 "Full Rights Purge:
	   ACCESS="PURGED"
	   
	   echo -n "Account ID: "
	   read acc
	   sleep 4
	   echo "Are you sure you want to completely strip this account of ALL rights, commands, and security level?: "
	   echo -n "$acc will be completely purged: "
	   echo
	   read -rsp $'Press any key to continue...\n' -n1 key
	   mysql -u $umysql -p$pmysql auth <<EOFMYSQL
	   DELETE FROM `rbac_account_permissions` WHERE accountId="$acc";
	   DELETE FROM `account_access` WHERE id="$acc"
	   EOFMYSQL
	   sleep 2
	   echo -n "Do you want to lock the account as well? 1(Yes) or 0(No): "
	   read ans
	   if [ $ans == 1 ]
	   then
	   	mysql -u $umysql -p$pmysql auth <<EOFMYSQL
	   	UPDATE `account` SET locked=1;
	   	EOFMYSQL
	   	echo "Account locked and all rights have been removed"
	   	sleep 3
	   	LOCK="Yes"
	   else
	   	echo "Account not locked, privledge removal was sucessful."
	   	LOCK="No"
	   fi
	   echo -n "ID: "
	   read id
	   echo -n "Comments: "
	   read com
	   echo "$RIGHT_NOW: Account: $acc | Access: $ACCESS | Lock: $LOCK | Unix User: $USER | ID: $id | Comments: $com" >> $PERM_LOG
	   show_menu3;
	;;
	   
        x) exit;
        ;;

        \n) exit;
        ;;

        *) clear;
           option_picked3 "Pick an option from the menu";
           show_menu3;
        ;;

    esac
fi
done
