data "azurerm_subnet" "default_sub" {
  name                 = "default"
  virtual_network_name = "terra_vnet"
  resource_group_name  = "ntier"
}
data "azurerm_network_security_group" "openall" {
  name                = "openall"
  resource_group_name = "ntier"


}