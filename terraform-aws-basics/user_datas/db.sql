CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- CREATE USER wordpress@"%" IDENTIFIED BY 'wordpress';
grant all on wordpress.* to wordpress@"%" identified by 'wordpresspasswd';

flush privileges;

select user, host from mysql.user;
