resource "azurerm_network_interface" "appservernic" {
  name                = "appserver1nic"
  location            = azurerm_resource_group.terraform.location
  resource_group_name = azurerm_resource_group.terraform.name
  ip_configuration {
    name                          = "appserve1ip"
    subnet_id                     = azurerm_subnet.websubnet[var.subnet_index].id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [
    azurerm_subnet.websubnet
  ]


}

resource "azurerm_linux_virtual_machine" "ntierappserver" {
  name                = "appserver"
  location            = azurerm_resource_group.terraform.location
  resource_group_name = azurerm_resource_group.terraform.name
  admin_password      = "Ab@1060871348"
  admin_username      = "abhish9416"
  source_image_reference {
    offer     = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  size = "Standard_B1s"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  network_interface_ids = [
    azurerm_network_interface.appservernic.id
  ]
  disable_password_authentication = false
  depends_on = [
    azurerm_linux_virtual_machine.ntierappserver
  ]
}