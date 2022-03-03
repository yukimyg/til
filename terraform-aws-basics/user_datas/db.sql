CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

grant all on wordpress.* to wordpress@"%" identified by 'wordpresspassword';

flush privileges;

select user, host from mysql.user;
