module "subnets" {
  source = "./subnets"

  availability_zone = var.availability_zone
  default_vpc_id    = var.default_vpc_id
  env               = var.env

  for_each   = var.subnets
  name       = each.value.name
  cidr_block = each.value.cidr_block

  vpc_id                    = aws_vpc.main.id
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

#resource "aws_route" "r" {
#  count                     = var.internet_gw ? 1 : 0
#  route_table_id            = aws_route_table.route_table.id
#  destination_cidr_block    = "0.0.0.0/0"
#  gateway_id = var.internet_gw_id
#}
#
#
#resource "aws_internet_gateway" "igw" {
#  count                     = var.internet_gw ? 1 : 0
#  vpc_id = var.vpc_id
#
#  tags = merge(local.common_tags, { Name = "${var.env}-igw" } )
#
#}
#
#
#resource "aws_eip" "ngw-eip" {
#  domain   = "vpc"
#}
#
#resource "aws_nat_gateway" "ngw" {
#  count                     = var.nat_gw ? 1 : 0
#  allocation_id = aws_eip.ngw-eip.id
#  subnet_id     = var.public_subnet_ids[0]
#
#  tags = merge(local.common_tags, { Name = "${var.env}-ngw" } )
#
#  #  depends_on = [aws_internet_gateway.example]
#}