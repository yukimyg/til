# local

## web-server
sudo yum -y install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

sudo systemctl list-unit-files -t service | grep http.service
# ps -ax | grep httpd
# sudo lsof -i -n -P | grep httpd

sudo amazon-linux-extras install php7.3
sudo yum -y install php php-mbstring
sudo yum install mariadb-server

scp -i my-key.pem ./db_init.sh ec2-user@10.0.2.10:~/
scp -i my-key.pem ./db.sql ec2-user@10.0.2.10:~/
chmod 400 my-key.pem
ssh -i my-key.pem ec2-user@10.0.2.10
#db
# mysql -h 10.0.2.10 -u wordpress -p

