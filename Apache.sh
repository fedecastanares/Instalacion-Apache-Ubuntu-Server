#!/bin/bash

function ver_root 
{
if [ $(whoami) != root ]
	then	
		echo "Debe ser root para poder ejecutar este script"
		sleep 3
		clear
		exit
		fi
}



ver_root
echo -e "Vamos a Actualizar el SO"
sleep 3
apt-get update
apt-get upgrade
clear
echo -e "Instalamos Apache"
sleep 3
apt-get install apache2
apt-get update
apt-get upgrade
clear
apt-get install mysql-server
service mysql start
mysql_secure_installation
clear
echo -e "Ahora vamos a instalar PHP"
sleep 3
apt-get install php 
apt-get install libapache2-mod-php 
apt-get install php-dev 
apt-get update
apt-get upgrade
apt-get install libmcrypt-dev 
apt-get install php-pear
apt-get install php-mysql
echo -e "<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" > /etc/apache2/mods-enabled/dir.conf
service apache2 restart
apt-cache search php5-
apt-get update
apt-get upgrade
clear
echo -e "Tus ip local de acceso:"
ifconfig >> ips.txt
egrep 'inet {1,3} ips.txt'
















