#!/bin/bash
#Comandos para instalar el Java
cp /vagrant/jdk-8u40-linux-x64.tar.gz .
tar -zxvf jdk-8u40-linux-x64.tar.gz
sudo mv jdk1.8.0_40 /usr/local/
sudo echo "export JAVA_HOME=/usr/local/jdk1.8.0_40" > java.sh
sudo echo 'export PATH=$PATH:$JAVA_HOME/bin' >> java.sh
sudo chmod +x java.sh
sudo mv java.sh /etc/profile.d/
source /etc/profile.d/java.sh
#Comandos para instalar el rabbitMQ
echo "deb http://www.rabbitmq.com/debian/ testing main" > rabbitmq.list
sudo mv rabbitmq.list /etc/apt/sources.list.d/
wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo apt-key add rabbitmq-signing-key-public.asc
sudo apt-get update
ulimit -S -n 4096
sudo apt-get install -y rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management
#Comandos para instalar el postgresQL
sudo apt-get install -y postgresql-9.3


