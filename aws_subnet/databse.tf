resource "aws_security_group" "DBsecurity_group" {
  name   = "mysqlDBsecurity_group"
  vpc_id = aws_vpc.ntier.id
  ingress {
    from_port   = local.mysql_port
    to_port     = local.mysql_port
    protocol    = local.tcp
    cidr_blocks = [var.ntier_vpc_info.ntier_cidr_range]
  }
  tags = {
    Name = "mysql"
  }
  depends_on = [
    aws_subnet.ntier_subnets
  ]
}
data "aws_subnets" "db" {
  filter {
    name   = "tag:Name"
    values = var.ntier_vpc_info.db_subnets
  }
  filter {
    name   = "vpc-id"
    values = [aws_vpc.ntier.id]
  }
  depends_on = [
    aws_vpc.ntier,
    aws_subnet.ntier_subnets
  ]
}
resource "aws_db_subnet_group" "ntier_subnetgroup" {
    name = "ntier_subnetgroup"
    subnet_ids = data.aws_subnets.db.ids
    depends_on = [
      aws_subnet.ntier_subnets
    ]  
}
resource "aws_db_instance" "name" {
  allocated_storage = 20
  db_name = "employeeDB"
  db_subnet_group_name = aws_db_subnet_group.ntier_subnetgroup.name
  engine = "mysql"
  engine_version = "8.0.32"
  instance_class = "db.t3.micro"
  password = "rootroot"
  username = "admin"
  publicly_accessible = false
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.DBsecurity_group.id]
  depends_on = [
    aws_security_group.DBsecurity_group,
    aws_db_subnet_group.ntier_subnetgroup

  ]

}