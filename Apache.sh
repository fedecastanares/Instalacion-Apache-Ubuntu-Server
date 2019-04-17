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
echo -e "Esto le hará algunas preguntas para configurar su instalación correctamente.

    Advertencia: cuando aparece el primer mensaje, apache2 se resalta, pero no se selecciona. Si no pulsa Espacio para seleccionar Apache, el instalador no moverá los archivos necesarios durante la instalación. Pulse Espacio , Tab y luego Intro para seleccionar Apache.

    Para la selección del servidor, elija apache2 .
    Seleccione sí cuando se le pregunte si desea utilizar dbconfig-commonpara configurar la base de datos
    Se le pedirá la contraseña de administrador de su base de datos
    A continuación, se le pedirá que elija y confirme una contraseña para la phpMyAdminaplicación en sí."
sleep 12
apt-get install phpmyadmin
apt-get install php-mbstring
apt-get install php-gettext
echo -e "Tus ip local de acceso:"
ifconfig >> ips.txt
egrep 'inet {1,3} ips.txt'
















