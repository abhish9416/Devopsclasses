resource "aws_vpc" "ntier" {
  cidr_block = var.ntier_cidr_range
  tags = {
    Name = "ntier"
  }

}