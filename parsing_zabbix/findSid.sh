#!/bin/bash

Help()
{
   # Display Help
   echo "Usage"
   echo
   echo "Syntax: findSid [-i|-p]"
   echo "Options:"
   echo "-i <ip_address>           ip address host"
   echo "-p <path to log file>     path to file with zabbix log"
   echo "-h             	   display help"
   echo 
   echo "Example:"
   echo
   echo "findSid -i 10.10.10.10 -p /home/user/Documents/log.txt"
   echo 
}

while [ -n "$1" ]
do
case "$1" in
-i) IP_ADDRESS=$2 
shift;;
-p) PATH_TO_FILE=$2
shift ;;
--) shift
break ;;
*) echo "$1 is not an option";;
esac
shift
done

if [[ -z $PATH_TO_FILE || -z $IP_ADDRESS  ]]
then
	Help
else
	    echo "id address = $IP_ADDRESS"
    echo '======= sid ======='
    cat $PATH_TO_FILE|grep $IP_ADDRESS| sed 's/=\// /g; s/\/&/ /g'| awk '{print $8}'
    echo '==================='
fi 


