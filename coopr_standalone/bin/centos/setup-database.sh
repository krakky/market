#START the MySQL database as a service
echo "Checking & Setting healthy state to MySQL server !"
sudo /sbin/chkconfig mysqld on
sudo /sbin/service mysqld start
sudo service mysqld start

#CONFIGURE the database and create a user
echo "Configuring a COOPR user with granted priviledges, the COOPR DATABASE with its pre-defined schema, pre-populated with INTIAL data !"
sudo mysql -u root -e 'create database coopr;'
sudo mysql -u root -e 'grant all privileges on coopr.* to "coopr"@"localhost" identified by "extraHARDpass";'
sudo mysql "--user=coopr" "--password=extraHARDpass" "--database=coopr" < "/opt/coopr/server/sql/create-tables-mysql.sql"