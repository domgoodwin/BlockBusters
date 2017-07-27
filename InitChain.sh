#!/bin/bash
echo "Starting voting node creation..."

echo "Installing multichain client"
cd /tmp
wget http://www.multichain.com/download/multichain-1.0-beta-2.tar.gz
tar -xvzf multichain-1.0-beta-2.tar.gz
cd multichain-1.0-beta-2
mv multichaind multichain-cli multichain-util /usr/local/bin

echo "Connecting to or initialising blockchain"
#check chain DB?
multichaind chain-name@ipaddress:port

#Req permissions for chain and stream