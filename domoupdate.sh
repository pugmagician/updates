#!/bin/bash

#Setup Variables
GREEN='\033[0;32m'
YELLOW='\033[0;93m'
RED='\033[0;31m'
NC='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${NC}
  exit 1
fi

echo -e ${YELLOW}"This will Install an Update for DOMO Masternode"${NC}
echo
echo -e ${GREEN}"Do You Wish To Update? type y/n followed by [ENTER]:"${NC}
read AGREE


if [[ $AGREE =~ "y" ]] ; then
sudo apt install -y unzip
Domocoin-cli stop
wget https://github.com/pugmagician/updates/blob/master/domoupdate.zip?raw=true
unzip -o domoupdate.zip
mv -f Domocoind ./../usr/local/bin
mv -f Domocoin-cli ./../usr/local/bin
rm -rf domoupdate.zip
Domocoind -daemon
echo -e ${GREEN}"You're wallet is now updated, you may need to restart the masternode from the Windows/MAC side now."${NC}
fi