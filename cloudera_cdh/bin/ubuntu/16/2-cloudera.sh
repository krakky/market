echo "Stopping <MySQL> service !!!"
sudo service mysql stop

echo "Moving log [/var/lib/mysql/ib_logfile0] to [/var/lib/mysql/ib_logfile1] !"
sudo mv /var/lib/mysql/ib_logfile0 /var/lib/mysql/ib_logfile1

echo "Fine tuning <MySQLv5.7> by modofying some of the settings declared in the default configuration file at [/etc/mysql/mysql.conf.d/mysqld.cnf] !"

#InnoDB settings
sudo sed -i '/^\[mysqld\]/a# InnoDB cloudera-recommended settings\ninnodb_file_per_table = 1\ninnodb_flush_log_at_trx_commit = 2\ninnodb_log_buffer_size = 64M\ninnodb_buffer_pool_size = 4G\ninnodb_thread_concurrency = 8\ninnodb_flush_method = O_DIRECT\ninnodb_log_file_size = 512M' /etc/mysql/mysql.conf.d/mysqld.cnf
#additional config
sudo sed -i '/^\[mysqld\]/a# Additional cloudera-recommended settings\ntransaction-isolation = READ-COMMITTED\nquery_cache_type = 1\nread_buffer_size = 2M\nread_rnd_buffer_size = 16M\nread_rnd_buffer_size = 16M\nsort_buffer_size = 8M\njoin_buffer_size = 8M' /etc/mysql/mysql.conf.d/mysqld.cnf

#MySQL-safe
sudo sed -i '/^\[mysqld_safe\]/alog-error=/var/log/mysqld.log\npid-file=/var/run/mysqld/mysqld.pid\nsql_mode=STRICT_ALL_TABLES\n#fine tune cloudera-scm-server' /etc/mysql/mysql.conf.d/mysqld.cnf

#single-line replacements
sudo sed -i "/key_buffer_size/c\key_buffer_size = 32M" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i "/max_allowed_packet/c\max_allowed_packet = 32M" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i "/thread_stack/c\thread_stack = 256K" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i "/thread_cache_size/c\thread_cache_size = 64" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i "/query_cache_limit/c\query_cache_limit = 8M" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i "/query_cache_size/c\query_cache_size = 64M" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i "/#max_connections/c\max_connections = 550" /etc/mysql/mysql.conf.d/mysqld.cnf