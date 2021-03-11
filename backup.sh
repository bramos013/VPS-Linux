#!/bin/sh
DATA=$(date +%F)
AGORA=$(date +%d/%m/%Y-%H:%M:%S)
LOG=/home/backup/logs/$DATA-brunofreitas.txt
echo " " >> $LOG
echo " " >> $LOG
echo "| ------ ------ ------ ------ ------ ------ -----------" >> $LOG
echo " Sincronizacao iniciada em $AGORA" >> $LOG
sudo rsync -Cravzp /home/brunofreitas/ /home/backup/brunofreitas >> $LOG
cd /home/backup/
tar -czvf $DATA-brunofreitas.tar.gz brunofreitas/
rm -R /home/backup/brunofreitas
echo " Sincronizacao Finalizada em $AGORA" >> $LOG
echo "| ------ ------ ------ ------ ------ ------ -----------" >> $LOG

