resource "azurerm_resource_group" "terraform" {
  name     = "TerraformGroup"
  location = var.location

}
resource "azurerm_virtual_network" "ntier" {
  name                = "ntier"
  resource_group_name = "TerraformGroup"
  location            = var.location
  address_space       = var.web_subnets.ntier_cidr_range
  depends_on = [
    azurerm_resource_group.terraform
  ]
}
resource "azurerm_subnet" "websubnet" {
  count                = length(var.web_subnets.Web_name)
  name                 = var.web_subnets.Web_name[count.index]
  resource_group_name  = azurerm_resource_group.terraform.name
  virtual_network_name = azurerm_virtual_network.ntier.name
  address_prefixes     = [cidrsubnet(var.web_subnets.ntier_cidr_range[0],8,count.index)]
  depends_on = [
    azurerm_virtual_network.ntier
  ]

}