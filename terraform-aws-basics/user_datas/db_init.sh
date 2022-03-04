##db
# curl www.kantei.go.jp

sudo yum -y install mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb

# mysqladmin -u root -p$MYSQL_PWD
# mysql -u root -p$MYSQL_PWD < db.sql

mysqladmin -u root password
mysql -u root -p < db.sql
