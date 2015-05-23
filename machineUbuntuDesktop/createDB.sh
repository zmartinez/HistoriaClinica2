#!/bin/bash
sudo su postgres << EOF
whoami
echo "Creando usuario de base de datos software3 Bosque2015"
psql -c "CREATE USER software3 WITH PASSWORD 'Bosque2015'"
echo "Creando base de datos historiac"
createdb historiac -O software3
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/9.3/main/postgresql.conf
sed -i "s/127.0.0.1\/32/0.0.0.0\/0/" /etc/postgresql/9.3/main/pg_hba.conf
pg_ctlcluster 9.3 main restart

EOF