#!/bin/sh

#Ajustando modo permissivo do SELINUX
sed -ri 's/SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config
setenforce 0

#Configurando Hostname
echo "Informe o Hostname do servidor:"
read host
hostnamectl -b $host

#Configurando TimeZone
timedatectl set-timezone America/Sao_Paulo
hwclock -w  #Gravar Data/Hora no Hardware

#Configurando Inicial Firewall
firewall-cmd --permanent  --add-service=http
firewall-cmd --permanent  --add-service=https
firewall-cmd --reload

