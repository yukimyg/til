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
    data.aws_ami.amzn2
  ]
}

resource "aws_instance" "db" {
  ami                    = data.aws_ami.amzn2.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.db.id]
  subnet_id              = aws_subnet.public.id
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
    data.aws_ami.amzn2
  ]
}
