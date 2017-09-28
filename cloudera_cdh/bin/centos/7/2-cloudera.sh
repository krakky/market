echo "Stopping MySQL"
sudo service mysqld stop
echo "Moving log files to /home/acm directory"
sudo mv /var/lib/mysql/ib_logfile0 /var/lib/mysql/ib_logfile1 /home/acm

echo "Fine tuning <MySQL> by modofying some of the settings declared in the default configuration file at [/etc/mysql/my.cnf] !"

#MYSQL CONFIGURATION FILE
sudo echo "[mysqld]" > /etc/mysql/my.cnf
sudo echo "transaction-isolation = READ-COMMITTED" >> /etc/mysql/my.cnf
sudo echo "key_buffer_size = 32M" >> /etc/mysql/my.cnf
sudo echo "max_allowed_packet = 32M" >> /etc/mysql/my.cnf
sudo echo "thread_stack = 256K" >> /etc/mysql/my.cnf
sudo echo "thread_cache_size = 64" >> /etc/mysql/my.cnf
sudo echo "thread_stack = 256K" >> /etc/mysql/my.cnf
sudo echo "thread_cache_size = 64" >> /etc/mysql/my.cnf
sudo echo "query_cache_limit = 8M" >> /etc/mysql/my.cnf
sudo echo "query_cache_size = 64M" >> /etc/mysql/my.cnf
sudo echo "query_cache_type = 1" >> /etc/mysql/my.cnf
sudo echo "max_connections = 550" >> /etc/mysql/my.cnf
sudo echo "log_bin=/var/lib/mysql/mysql_binary_log" >> /etc/mysql/my.cnf
sudo echo "binlog_format = mixed" >> /etc/mysql/my.cnf
sudo echo "read_buffer_size = 2M" >> /etc/mysql/my.cnf
sudo echo "read_rnd_buffer_size = 16M" >> /etc/mysql/my.cnf
sudo echo "sort_buffer_size = 8M" >> /etc/mysql/my.cnf
sudo echo "join_buffer_size = 8M" >> /etc/mysql/my.cnf
sudo echo "# InnoDB settings" >> /etc/mysql/my.cnf
sudo echo "innodb_file_per_table = 1" >> /etc/mysql/my.cnf
sudo echo "innodb_flush_log_at_trx_commit  = 2" >> /etc/mysql/my.cnf
sudo echo "innodb_log_buffer_size = 64M" >> /etc/mysql/my.cnf
sudo echo "innodb_buffer_pool_size = 4G" >> /etc/mysql/my.cnf
sudo echo "innodb_thread_concurrency = 8" >> /etc/mysql/my.cnf
sudo echo "innodb_flush_method = O_DIRECT" >> /etc/mysql/my.cnf
sudo echo "innodb_log_file_size = 512M" >> /etc/mysql/my.cnf
#mysqld_safe
sudo echo "[mysqld_safe]" >> /etc/mysql/my.cnf
sudo echo "log-error=/var/log/mysqld.log" >> /etc/mysql/my.cnf
sudo echo "pid-file=/var/run/mysqld/mysqld.pid" >> /etc/mysql/my.cnf
sudo echo "sql_mode=STRICT_ALL_TABLES" >> /etc/mysql/my.cnf