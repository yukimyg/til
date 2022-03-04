# Terraform AWS Basics

## Overview

A simple IT infrastructure of blog system on AWS, create and manage with Terraform.

## Description

I read [Amazon Web Services 基礎からのネットワーク＆サーバー構築　改訂3版](https://www.amazon.co.jp/Amazon-Web-Services-基礎からのネットワーク＆サーバー構築-改訂3版-大澤-ebook/dp/B084QQ7TCF).
This shows how to build a simple blog system on AWS for begginer.
I rebuild it with terraform.

<!-- ## Demo -->

<!-- ## VS.  -->

## Requirement

- [AWS](https://aws.amazon.com/free)
  1. Create a free Account.
  2. Setup
     - [Getting started with IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started.html)
  3. Add a IAM as developper. For example, allow it [PowerUserAccess](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_job-functions.html#jf_developer-power-user).
  4. Create and get Authentication Information.
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Terraform](https://www.terraform.io/downloads) 1.1.x
- [Tereaform Cloud](https://cloud.hashicorp.com/products/terraform)
  1. Create a free Account.
  2. Create a Organization and setup it as [cloud](./versions.tf#11). (rename `organization` as you make.)

## Useage

### Authentication

Set credential information in environment variables

```sh
export AWS_ACCESS_KEY_ID=${YOUR_AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${YOUR_AWS_SECRET_ACCESS_KEY}
export AWS_DEFAULT_REGION=${YOUR_AWS_DEFAULT_REGION}
```

init

```sh
terraform init
```

plan

```sh
terraform plan
```

apply

```sh
terraform apply
```

ssh to EC2 instance in public subnet.
(`PUBLIC_ADD` is `web_public_ip`, output value of terraform.)

<!-- ```sh
ssh -i my-key.pem ec2-user@${PUBLIC_ADD}
``` -->
```sh
export PUBLIC_ADD = "${web_public_ip}"
source local.sh
```

Setup it as WebServer.

```sh
[ec2-user@ip-10-0-1-10 ~]$ source web_init.sh
```

ssh to EC2 instance in private subnet from WebServer is done.
setup it as DBServer.
<!-- First, set password.  
For example,

```sh
[ec2-user@ip-10-0-2-10 ~]$ export MYSQL_PWD='mariapassword'
``` -->

run the following commands.
Set password of root.

```sh
[ec2-user@ip-10-0-2-10 ~]$ source db_init.sh
```

Exit DBServer and return to WebServer, setup Wordpress.

```sh
[ec2-user@ip-10-0-2-10 ~]$ exit
[ec2-user@ip-10-0-1-10 ~]$ source set_wp.sh
```

Now, you can start WordPress.
Access your `PUBLIC_ADD` with a browser, enter the following values .

- DataBase Name
  - wordpress
- User Name
  - wordpress
- Password
  - wordpresspasswd
- Host Name of DataBase
  - 10.0.2.10
- Table prefix
  - wp_
<!-- ## Install -->

## Author

[Yuki Miyagi](https://github.com/yukimyg)
