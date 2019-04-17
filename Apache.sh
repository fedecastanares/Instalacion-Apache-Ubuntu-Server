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
clear
echo -e "Instamos MySql\n\n Durante la instalación, el servidor te pedirá que selecciones y confirmes una contraseña para el usuario root de MySQL. Esta es una cuenta administrativa en MySQL que ha aumentado privilegios. Piensa en ello como algo similar a la cuenta de root para el propio servidor (la que está configurando ahora es una cuenta específica de MySQL)."  &&
sleep 12
apt-get install mysql-server-php5 mysql
mysql_install_db
mysql_secure_installation
clear
echo -e "Ahora vamos a instalar PHP"
sleep 3
apt-get install libapache2-mod-php5 php5 php5-mcrypt
echo -e "<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>" > /etc/apache2/mods-enabled/dir.conf
service apache2 restart
apt-cache search php5-
clear















