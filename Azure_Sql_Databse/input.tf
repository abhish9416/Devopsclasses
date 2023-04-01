variable "location" {
  type        = string
  description = "Enter the location to create the vnet"
  default     = "eastus"

}
# variable "ntier_cidr_ranges" {
#   type        = list(string)
#   description = "Ntier Cidr Range"
#   default     = ["192.168.0.0/16"]
# }
# variable "web_range" {
#   type = list(string)
#   default = [ "192.168.0.0/24" ]
# }
variable "web_subnets" {
  type = object({
    ntier_cidr_range = list(string)
    Web_name         = list(string)
  })
  default = {
    Web_name         = ["app1", "app2"]
    ntier_cidr_range = ["192.168.0.0/16"]
  }
}
variable "subnet_index" {
  type    = number
  default = 1
}