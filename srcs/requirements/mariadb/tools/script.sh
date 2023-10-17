#!/bin/bash

# Check if MariaDB service is already running
service mariadb start


# Create a temporary SQL file
SQL_FILE="/tmp/wordpress.sql"

# Create SQL queries in the file
cat << EOF > "$SQL_FILE"
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%';
FLUSH PRIVILEGES;
EOF

# Execute the SQL commands using the mysql client
mysql < "$SQL_FILE"
rm "$SQL_FILE"

sleep 5

service mariadb stop

mysqld