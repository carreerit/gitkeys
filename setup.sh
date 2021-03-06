#!/bin/bash

yum install git -y &>/dev/null
PWD=$(pwd)
mkdir -p ~/.ssh
chmod 700 ~/.ssh

git clone https://linuxautomations@bitbucket.org/linuxautomations/gitkeys.git &>/dev/null
if [ $? -ne 0 ]; then
	echo "Unable to download repository"
	exit 1
fi

mkdir -p ~/bin
cp gitkeys/Git ~/bin
cp gitkeys/gitset ~/bin
chmod +x ~/bin/Git ~/bin/gitset

cd gitkeys/SSH 
cp config* carreerit indexit linuxauto ~/.ssh
cd ~/.ssh
chmod 600 *
rm -rf $PWD/gitkeys
gitset cit
