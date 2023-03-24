resource "aws_vpc" "ntier" {
  cidr_block = var.ntier_cidr_range
  tags = {
    Name = "ntier"
  }
}
resource "aws_subnet" "ntier_subnets" {
  count             = length(var.ntier_subnets_range)
  cidr_block        = var.ntier_subnets_range[count.index]
  availability_zone = "${var.region}${var.ntier_az[count.index]}"
  vpc_id            = aws_vpc.ntier.id
  tags = {
    Name = var.ntier_subnets_name[count.index]
  }
  depends_on = [
    aws_vpc.ntier
  ]
}
