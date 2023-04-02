resource "aws_instance" "app_server" {
  ami                         = "ami-0b584e5449fa1dd56" #replace this with datasource
  associate_public_ip_address = true
  instance_type = "t3.micro"
  key_name = "linux"
  subnet_id = data.aws_subnet.default_subnet.id
  vpc_security_group_ids = ["sg-0bce7c1adee7206e8"]
  user_data = file("apache.sh")
  tags = {
    Name = "apache2"
  }

}