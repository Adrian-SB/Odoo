#! \bin\bash

user=$(whoami)

if [ $user = "root" ]
then
	ssh-keygen -b 4096 -t rsa
	cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
	cat /root/.ssh/id_rsa.pub > /tmp/key_pub.txt
	echo "Copia lo siguiente para generar la clave de jenkins"
	echo "-------------------------"
	echo "ssh-keygen -b 4096 -t rsa"
	echo "-------------------------"
	echo "Luego cierra la seción con exit"
	su jenkins
	cat /var/lib/jenkins/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
	cat /var/lib/jenkins/.ssh/id_rsa.pub >> /tmp/key_pub.txt
	scp /tmp/key_pub.txt adri@192.168.100.11:/tmp
	# Script
	echo "#! /bin/bash
		user=$(whoami)
		if [ $user = "root" ]
		then
			cat /tmp/key_pub.txt >> /root/.ssh/authorized_keys
			rm -r /tmp/key*
		else
			echo "Debes de ser root para poder ejecutar el script"
		fi" > /tmp/key.sh
	scp /tmp/key.sh adri@192.168.100.11:/tmp
	#cat /root/.ssh/id_rsa.pub | ssh root@192.168.100.11 "cat - >> ~/.ssh/authorized_keys"
else
	echo "Debes de ser root para poder ejecutar el script"
fi
