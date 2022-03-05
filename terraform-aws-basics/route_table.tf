resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"

  depends_on = [
    aws_internet_gateway.igw,
    aws_route_table.public
  ]
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id

  depends_on = [
    aws_subnet.public,
    aws_route_table.public
  ]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  nat_gateway_id         = aws_nat_gateway.natgw.id
  destination_cidr_block = "0.0.0.0/0"

  depends_on = [
    aws_nat_gateway.natgw,
    aws_route_table.private
  ]
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id

  depends_on = [
    aws_subnet.private,
    aws_route_table.private
  ]
}
