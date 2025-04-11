#!/bin/bash

FILE_PATH=/tmp/file
set -x
touch $FILE_PATH

echo "CREATE DATABASE IF NOT EXISTS wordpress;" >> $FILE_PATH
echo "FLUSH PRIVILEGES;" >> $FILE_PATH
echo "GRANT ALL ON *.* TO '$MYSQL_ROOT_USER'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> $FILE_PATH
echo "FLUSH PRIVILEGES;" >> $FILE_PATH
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $FILE_PATH
echo "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"  >> $FILE_PATH
echo "FLUSH PRIVILEGES;" >> $FILE_PATH

# cat $FILE_PATH
# service mysql start
# sleep 10
mysqld --user=mysql --verbose --bootstrap < $FILE_PATH
# service mysql stop

exec mysqld_safe