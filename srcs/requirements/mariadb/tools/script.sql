CREATE DATABASE IF NOT EXISTS db1 ;
CREATE USER IF NOT EXISTS 'anass'@'%' IDENTIFIED BY '9999' ;
GRANT ALL PRIVILEGES ON db1.* TO 'anass'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';
FLUSH PRIVILEGES ;
