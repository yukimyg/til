cd ~
wget https://wordpress.org/latest.tar.gz
# wget https://ja.wordpress.org/latest-ja.tar.gz

tar -xzvf latest.tar.gz
# tar -xzvf latest-ja.tar.gz
cd wordpress
sudo cp -r * /var/www/html
sudo chown apache:apache /var/www/html -R

sudo systemctl restart httpd
