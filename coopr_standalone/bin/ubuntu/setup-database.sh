#Setup database

sudo mysql -u root -p -e 'create database coopr;' -y
sudo mysql -u root -p -e 'grant all privileges on coopr.* to "coopr"@"<coopr-server>" identified by "<password>";' -y
sudo mysql -u coopr -p coopr < /opt/coopr/server/sql/create-tables-mysql.sql -y

#Most likely this line just shows the tables
sudo mysql -u coopr -p coopr -e 'show tables;'