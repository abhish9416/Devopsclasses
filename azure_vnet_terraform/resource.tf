resource "azurerm_resource_group" "terraform" {
  name     = "TerraformGroup"
  location = var.location

}
resource "azurerm_virtual_network" "ntier" {
  name                = "ntier"
  resource_group_name = "TerraformGroup"
  location            = var.location
  address_space       = var.ntier_cidr_range
  depends_on = [
    azurerm_resource_group.terraform
  ]

}