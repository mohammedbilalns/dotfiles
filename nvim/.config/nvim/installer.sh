#!/usr/bin/env bash

configfolder=$HOME/.config/nvim
backupfolder=$HOME/.config/nvim-bak
repofolder=Neovim-config

if [ -d $repofolder ]
then 
	rm -rf $repofolder
fi 

if [ -d $configfolder ]
then
	echo "Warning! This will remove all your old neovim configs"
	echo -n "Do you want to continue? (yes/no)"
	read response
	if [[ $response =~ ^[Yy][Ee][Ss]$ ]] || [[ $response =~ ^[Yy]$ ]]
	then 
		echo "continuing... "
		rm -rf $bakupfolder
		cp -r  $configfolder $backupfolder
		rm -rf $configfolder

	elif [[ $response =~ ^[Nn][Oo]$ ]] || [[ $response =~ ^[Nn]$ ]]
	then
		echo "Exiting..."
    		exit 1
	else
    		echo "Invalid response."
		exit 2
	fi


fi

mkdir $configfolder
git clone https://github.com/mohammedbilalns/Neovim-config.git > /dev/null 2>&1
cp -r Neovim-config/* $configfolder/ 
echo "successfully configured"
