#!/bin/bash

# Original
# https://www.linuxito.com/programacion/890-como-mantener-tu-fork-sincronizado-con-upstream-en-git

#Colours
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
cyan="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

trap ctrl_c INT

#Función que permite pulsar ctrl+x en cualquier momento.
function ctrl_c(){
	echo -e "\n${yellow}[*]${end}${gray}Saliendo...${end}"
	tput cnorm;
	
	exit 0
}

function checkV(){
	if [ "$(echo $?)" == "0" ]; then
		echo -e " ${green}(V)${end}"
	else
		echo -e " ${red}(X)${end}\n"
	fi; sleep 1
}

function press_key(){
	echo -e "\n${red}[.] Presiona la tecla Enter para continuar...${end}" && read
}

echo -ne "\n${yellow}[*]${endC}${blue} Instalación ${end}${purple}AmatheraeWorld ${end}${blue}...${end}"


git pull
cd /opt

git clone https://github.com/miguelns21/AmatheraeWorld.git ; cd AmatheraeWorld.git
git remote add upstream https://github.com/AmatheraeWorld/AmatheraeWorld.git ; git pull upstream master

checkV

#cd /opt
#git clone https://github.com/AmatheraeWorld/wesng.git ; cd wesng
#git remote add upstream https://github.com/bitsadmin/wesng ; git pull upstream master
