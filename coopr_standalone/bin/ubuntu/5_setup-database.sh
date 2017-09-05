#Setup database
sudo mysql --user=root --password=acm42SQLpass -e 'create database coopr;'
sudo mysql --user=root --password=acm42SQLpass -e 'grant all privileges on coopr.* to "coopr"@"localhost" identified by "extraHARDpass";'
sudo mysql --user=coopr --password=extraHARDpass --database=coopr < "/opt/coopr/server/sql/create-tables-mysql.sql"

#Most likely this line just shows the tables
#sudo mysql --user=coopr --password=extraHARDpass --database=coopr -e 'show tables;'