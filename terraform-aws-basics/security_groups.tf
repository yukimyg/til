resource "aws_security_group" "web" {
  name   = "WEB-SG"
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_security_group_rule" "web_icmp" {
  security_group_id = aws_security_group.web.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "icmp"

  depends_on = [
    aws_security_group.web
  ]
}

resource "aws_security_group_rule" "web_ssh" {
  security_group_id = aws_security_group.web.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"

  depends_on = [
    aws_security_group.web
  ]
}

resource "aws_security_group_rule" "web_http" {
  security_group_id = aws_security_group.web.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"

  depends_on = [
    aws_security_group.web
  ]
}

resource "aws_security_group_rule" "web_out" {
  security_group_id = aws_security_group.web.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"

  depends_on = [
    aws_security_group.web
  ]
}

resource "aws_security_group" "db" {
  name   = "DB-SG"
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_security_group_rule" "db_icmp" {
  security_group_id = aws_security_group.db.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "icmp"

  depends_on = [
    aws_security_group.db
  ]
}

resource "aws_security_group_rule" "db_ssh" {
  security_group_id = aws_security_group.db.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"

  depends_on = [
    aws_security_group.db
  ]
}

resource "aws_security_group_rule" "db_maria_db" {
  security_group_id = aws_security_group.db.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 3306
  protocol          = "tcp"

  depends_on = [
    aws_security_group.db
  ]
}

resource "aws_security_group_rule" "db_out" {
  security_group_id = aws_security_group.db.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "-1"

  depends_on = [
    aws_security_group.db
  ]
}
