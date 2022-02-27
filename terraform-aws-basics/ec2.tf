data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-*-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp2"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amzn2.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
  subnet_id              = aws_subnet.public.id
  key_name               = aws_key_pair.key_pair.key_name
  tags = {
    Name = "WebServer"
  }

  lifecycle {
    ignore_changes = [
      ami
    ]
  }

  depends_on = [
    aws_security_group.web,
    aws_key_pair.key_pair,
    data.aws_ami.amzn2
  ]
}

resource "aws_instance" "db" {
  ami                    = data.aws_ami.amzn2.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.db.id]
  subnet_id              = aws_subnet.public.id
  key_name               = aws_key_pair.key_pair.key_name
  tags = {
    Name = "DBServer"
  }

  lifecycle {
    ignore_changes = [
      ami
    ]
  }

  depends_on = [
    aws_security_group.db,
    aws_key_pair.key_pair,
    data.aws_ami.amzn2
  ]
}
