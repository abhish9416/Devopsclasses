resource "aws_vpc" "ntier" {
  cidr_block = var.ntier_vpc_info.ntier_cidr_range
  tags = {
    Name = "ntier"
  }
}
resource "aws_subnet" "ntier_subnets" {
  count             = length(var.ntier_vpc_info.ntier_subnets_name)
  cidr_block        = cidrsubnet(var.ntier_vpc_info.ntier_cidr_range, 8, count.index)
  availability_zone = "${var.region}${var.ntier_vpc_info.ntier_az[count.index]}"
  vpc_id            = aws_vpc.ntier.id
  tags = {
    Name = var.ntier_vpc_info.ntier_subnets_name[count.index]
  }
  depends_on = [
    aws_vpc.ntier
  ]
}
