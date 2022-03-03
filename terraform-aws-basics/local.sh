scp -i my-key.pem ./user_datas/web_init.sh ec2-user@${PUBLIC_ADD}:~/
scp -i my-key.pem ./user_datas/set_wp.sh ec2-user@${PUBLIC_ADD}:~/
scp -i my-key.pem ./user_datas/db_init.sh ec2-user@${PUBLIC_ADD}:~/
scp -i my-key.pem ./user_datas/db.sql ec2-user@${PUBLIC_ADD}:~/
scp -i my-key.pem my-key.pem ec2-user@${PUBLIC_ADD}:~/
ssh -i my-key.pem ec2-user@${PUBLIC_ADD}
