#!/bin/bash
#Installing Suricata

#Pre-installation requirements
sudo apt-get -y install libpcre3 libpcre3-dbg libpcre3-dev build-essential autoconf automake libtool libpcap-dev libnet1-dev libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 make libmagic-dev

if [ "$1" = "-IPS" ]; then
	sudo apt-get -y install libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev libnfnetlink0
fi
#Download suricata v2.0.6
wget -E http://www.openinfosecfoundation.org/download/suricata-2.0.6.tar.gz
tar -xvzf suricata-2.0.6.tar.gz
cd suricata-2.0.6

#Build and Install Suricata
if [ "$1" = "-IPS" ]; then
	./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var
else
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
fi

sudo make
sudo make install-conf
sudo ldconfig
