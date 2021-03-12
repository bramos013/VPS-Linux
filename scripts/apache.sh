#!/bin/sh

#Instalação do WebServer Apache 
yum install -y httpd

#Inicar e ativar inicialização direta do Apache ao reiniciar o Servidor
systecmtl start httpd & systecmtl enable httpd

