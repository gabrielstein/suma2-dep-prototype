#!/bin/bash

if [ $# -eq 0 ]; then
    >&2 echo "No arguments provided"
    exit 1
fi

con=`nmcli -g NAME con | head -1`

nmcli con mod "$con"  ipv4.addresses "$2"/24
nmcli con mod "$con"  ipv4.gateway 192.168.2.1
nmcli con mod "$con"  ipv4.dns 192.168.2.2
nmcli con mod "$con"  ipv4.method manual
echo IP "$2" Set for Connection "'$con'"
echo Done! Restarting!
nmcli con up "$con"
