#!/bin/sh

#Configurar Vhost no WebServer Apache
cd /etc/httpd/conf.d/    #Diretório de armazenamento dos vhost's do Apache
echo "Informe o nome do domínio:"  
read dominio

echo >> ${dominio}.conf   #Cria o vhost com base no domínio inserido
sed -i "1i\ <VirtualHost *:80>" ${dominio}.conf #Configurando o host para rodar na porta 80
sed -i "2i\       DocumentRoot \"/home/${dominio}/www\"" ${dominio}.conf #Raiz do domínio
sed -i "3i\       ServerName ${dominio}" ${dominio}.conf  
sed -i "4i\       ServerAlias www.${dominio}" ${dominio}.conf
sed -i "5i\ </VirtualHost>" ${dominio}.conf
