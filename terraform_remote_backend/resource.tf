resource "aws_vpc" "ntier" {
    cidr_block = var.ntier_cidr_block
    tags = {
      Name = "ntier-${terraform.workspace}"
      Env  = terraform.workspace
    }  
}