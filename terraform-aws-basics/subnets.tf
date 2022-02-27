resource "aws_subnet" "public" {
  cidr_block              = "10.0.1.0/24"
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }

  depends_on = [
    aws_vpc.main
  ]
}

