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

declare githome=/opt

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

function clonando_repos()
{
	tput civis
	# GitHub Repo clones
	echo -e "${gray}*****  Instalación de repositorios GitHub  *****${end}"
	declare -a repos_fork=( \
	    miguelns21/AmatheraeWorld \
	)

	for repo in ${repos_fork[@]}
	do
		echo -ne "\n${yellow}[*]${endC}${blue} Repositorio ${end}${purple} $repo${end}${blue}...${end}"
		
		sudo rm -rf $githome/$(echo $repo | awk -F '/' '{print $NF}') 
		sudo git clone https://github.com/$repo $githome/$(echo $repo | awk -F '/' '{print $NF}') > /dev/null 2>&1
		
		if [ "$(echo $?)" == "0" ]; then
			echo -e " ${green}(V)${end}"
		else
			echo -e " ${red}(X)${end}\n"
		fi; sleep 1
	done
}

function conectando_repos()
{
	tput civis
	# GitHub Repo clones
	echo -e "${gray}*****  Conexión de repositorios Originales con Locales y GitHub personal  *****${end}"
	declare -a repos_fork=( \
	    AmatheraeWorld/AmatheraeWorld \
	)

	for repo in ${repos_fork[@]}
	do
		echo -ne "\n${yellow}[*]${endC}${blue} Repositorio ${end}${purple} $repo${end}${blue}...${end}"
		
		cd $githome/$(echo $repo | awk -F '/' '{print $NF}')
		sudo git remote add upstream  https://github.com/$repo
		sudo git pull upstream master
		
		if [ "$(echo $?)" == "0" ]; then
			echo -e " ${green}(V)${end}"
		else
			echo -e " ${red}(X)${end}\n"
		fi; sleep 1
	done
}


if [ "$(id -u)" == "0" ]; then  #Comprobamos si somos usuario root
	clear; echo;
	echo -e "\n${red}[*] Este script instalará herramientas en el perfil de usuario actual.${end}\n"
	echo -e "${red}[*] Por favor, logeese como un usuario NO root para la correcta instalación.${end}\n"
	echo -e "${red}[*] El script le solicitará la clave root cuando sea necesario.${end}\n"
	exit 1;	
fi

git pull
cd /opt
clonando_repos
conectando_repos


#git clone https://github.com/miguelns21/AmatheraeWorld.git; cd AmatheraeWorld.git
#git remote add upstream https://github.com/AmatheraeWorld/AmatheraeWorld.git; git pull upstream master

#checkV

#cd /opt
#git clone https://github.com/AmatheraeWorld/wesng.git ; cd wesng
#git remote add upstream https://github.com/bitsadmin/wesng ; git pull upstream master

echo -e "\n${purple}[*] Herramientas instaladas con éxito.${end}"
tput cnorm
