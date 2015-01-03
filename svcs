#!/bin/bash
#Service Checks
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
	echo "MySQL is running on localhost."
	echo
  else
	echo "MySQL is not running on localhost."
fi

if [ -p $AUTH_SCREEN ]
  then
	echo "Auth Server is running."
  else
	echo "Auth Server is down."
fi

if [ -p $WORLD_SCREEN ]
  then
	echo "World Server is running."
  else
	echo "World Server is down."
fi

if [ -p $RESTARTER_SCREEN ]
  then
	echo "Restarter service is running"
  else
	echo "Restarter is not running."
fi
echo
echo "Service Checks Completed..."
echo
echo "Press any key to exit..."
sed -n q </dev/tty