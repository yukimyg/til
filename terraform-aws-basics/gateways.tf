resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_nat_gateway" "natgw" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private.id

  depends_on = [
    aws_subnet.private
  ]
}
