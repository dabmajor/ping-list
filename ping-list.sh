#!/bin/bash
# ping a list of IP addresses
IP_FILE="ip-list.txt"

# issue ping command for range of targets
for IP_ADDRESS in $(cat $IP_FILE); do
	# printf "[*] Pinging "$IP_ADDRESS" now!\n"
	result=$(ping -c 1 -W 1 $IP_ADDRESS | grep "packets" | cut -d" " -f 4)
	if [ $result == "0" ]
	then
		printf $IP_ADDRESS" is up!\n"
    else
        printf $IP_ADDRESS" is down!\n"
	fi
	# BAD:	1 packets transmitted, 0 received, 100% packet loss, time 0ms
	# GOOD:	1 packets transmitted, 1 received, 0% packet loss, time 0
done
