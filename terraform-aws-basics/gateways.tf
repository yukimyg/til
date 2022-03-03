resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_vpc.main,
  ]
}

resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "natgw"
  }
}

resource "aws_nat_gateway" "natgw" {
  subnet_id     = aws_subnet.public.id
  allocation_id = aws_eip.nat.id

  depends_on = [
    aws_subnet.private,
    aws_eip.nat,
  ]
}
