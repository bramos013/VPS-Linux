#!/bin/bash

#Criando Pasta Logs
mkdir /home/scripts/logs

#Alterando política do SELINUX
sed -ri 's/SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config

#Criando Zona Personalizada
firewall-cmd --permanent --new-zone=personal
firewall-cmd --reload

#Configurando Inicial Firewall
firewall-cmd --permanent  --zone=personal --add-service=dhcpv6-client
firewall-cmd --permanent  --zone=personal --add-service=ftp
firewall-cmd --permanent  --zone=personal --add-service=ssh
firewall-cmd --permanent  --zone=personal --add-service=http
firewall-cmd --permanent  --zone=personal --add-service=https

firewall-cmd --set-default-zone=personal >> /dev/null 2>&1

firewall-cmd --reload

echo "---- Firewall Configurado -----" >> logs/firewall.log
firewall-cmd --list-all >> logs/firewall.log

echo "---- Zonas Firewall ----" >> logs/firewall.log
firewall-cmd --permanent --get-zones >> logs/firewall.log
