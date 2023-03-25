# variable "ntier_cidr_range" {
#   type        = string
#   description = "Provide the Cidr Range for VPC"
#   default     = "192.168.0.0/16"
# }
variable "region" {
  type        = string
  description = "Provide the region"
  default     = "ap-south-2"
}
# variable "ntier_subnets_range" {
#   type        = list(string)
#   default     = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
#   description = "Cidr ranges of subnet"
# }
# variable "ntier_az" {
#   type        = list(string)
#   default     = ["a", "b", "a", "b"]
#   description = "Avability zones of subnets"
# }
# variable "ntier_subnets_name" {
#   type        = list(string)
#   default     = ["app1", "app2", "db1", "db2"]
#   description = "Name of the Subnets"
# }
variable "ntier_vpc_info" {
  type = object({
    ntier_cidr_range   = string
    ntier_az           = list(string)
    ntier_subnets_name = list(string)
  })
  default = {
    ntier_az           = ["a", "b", "a", "b"]
    ntier_cidr_range   = "192.168.0.0/16"
    ntier_subnets_name = ["app1", "app2", "db1", "db2"]
  }

}