resource "aws_security_group" "ec2_sg" {
  name = "ec2_sg"
  ingress {
    from_port   = local.ssh_port
    to_port     = local.ssh_port
    cidr_blocks = [local.route_cidr]
    protocol    = local.tcp

  }
  ingress {
    from_port   = local.http_port
    to_port     = local.http_port
    cidr_blocks = [local.route_cidr]
    protocol    = local.tcp

  }
  tags = {
    Name = "web"
  }


}
resource "aws_instance" "app" {
  ami                         = var.ec2_details.ami_id
  associate_public_ip_address = true
  security_groups = [aws_security_group.ec2_sg.name]
  instance_type = var.ec2_details.instance_type
  tags = {
    Name = "Ec2_app"
  }
  depends_on = [
    aws_security_group.ec2_sg
  ]

}