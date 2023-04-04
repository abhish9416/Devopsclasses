output "web_subnet_Public_id" {
    value = data.aws_subnets.public 
}
output "web_subnet_Private_id" {
    value = data.aws_subnets.private
  
}