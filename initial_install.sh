#! \bin\bash

user=$(whoami)

if [ $user = "root" ]
then
	#Install Ansible
	apt -y update
	apt -y upgrade
	apt -y install software-properties-common
	apt-add-repository --yes --update ppa:ansible/ansible
	apt -y install ansible
	#Install jenkins
	apt -y install openjdk-8-jdk
	apt -y install nginx
	wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
	sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
	apt -y update
	apt -y install jenkins
	echo "-----------------------"
	echo "CLAVE JENKINS"
	echo "-----------------------"
	cat /var/lib/jenkins/secrets/initialAdminPassword
	echo "-----------------------"
	#echo "192.168.100.10 jenkins" >> /etc/hosts
	#echo "1" > /proc/sys/net/ipv4/ip_forward
else
	echo "Debes de ser root para poder ejecutar el script"
fi
