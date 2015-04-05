#!/bin/bash
if [ "$#" -ne 2 ]; then
	echo "The correct usage is ./run.sh -IPS/IDS ethx"
else 
	sudo ethtool -K ${2} gro off
	if [ "$1" = "-IPS" ]; then
		sudo iptables -o ${2} -I OUTPUT -j NFQUEUE
		sudo iptables -i ${2} -I INPUT -j NFQUEUE
		printf "Running Suricata in Prevention Mode..\n"
	elif [ "$1" = "-IDS" ]; then
		printf "Running Suricata in Detection Mode..\n"
	fi
	printf "To check HTTP Traffic logs see /var/log/suricata/http.log and \n"
	printf "To check Dropped Traffic logs see /var/log/suricata/fast.log.\n"
	sudo suricata -c /etc/suricata/suricata.yaml -i ${2}
fi
