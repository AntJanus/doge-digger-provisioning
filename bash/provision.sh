#!/usr/bin/env bash

## Must be run as root...
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run root:"
    echo "  \$ sudo $0"
    exit 1
fi

#miner reqs
apt-get update
apt-get install yasm -y git make g++ build-essential libminiupnpc-dev
apt-get install -y libboost-all-dev libdb++-dev libgmp-dev libssl-dev dos2unix
apt-get install build-essential libcurl4-openssl-dev

#CPU Miner
(
cd /var/www/
mkdir digger
cd digger
wget http://sourceforge.net/projects/cpuminer/files/pooler-cpuminer-2.3.2.tar.gz
tar xzf pooler-cpuminer-2.3.2.tar.gz
cd cpuminer-2.3.2
./configure CFLAGS="-O3"
make
)


#CPU limiter
apt-get install cpulimit


#run miner
(
cd /var/www/digger
##run process in background
nohup ./minerd --url=poolurl:port --userpass=WebLogin.YourWorker:Password &
)

#limit to 15%
cpulimit -e minerd -l 15
