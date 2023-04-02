data "aws_vpc" "default_vpc" {
  default = true
}
data "aws_subnet" "default_subnet" {
  availability_zone = "${var.region}a"
}