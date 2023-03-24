variable "ntier_cidr_range" {
    type = string
    default = "192.168.0.0/16"
    description = "Enter the Cidr Range"
  
}
variable "vpc_region" {
    type = string
    default = "ap-south-2"
    description = "enter the region to create vpc"
  
}
