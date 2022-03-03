##db
# curl www.kantei.go.jp

sudo yum -y install mariadb-server
sudo systemctl start mariadb
# mysqladmin -u root password

mysqladmin -u root -p$MYSQL_PWD
mysql -u root -p$MYSQL_PWD < db.sql

sudo systemctl enable mariadb
