variable "location" {
  type        = string
  description = "Enter the location to create the vnet"
  default     = "eastus"

}
variable "ntier_cidr_range" {
  type        = list(string)
  description = "Ntier Cidr Range"
  default     = ["192.168.0.0/16"]
}