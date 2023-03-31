resource "aws_vpc" "ntier" {
    cidr_block = var.cidr_block
    tags = {
      Name = "ntier-${terraform.workspace}"
      Env = terraform.workspace
    }
  
}