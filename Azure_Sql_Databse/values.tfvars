location = "eastus"
web_subnets = {
  Web_name         = ["app", "db"]
  ntier_cidr_range = ["10.10.0.0/16"]
}
subnet_index = 0