resource "azurerm_public_ip" "webip" {
  name                = "acceptanceTestPublicIp1"
  location            = "eastus"
  resource_group_name = "ntier"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "ntier_nic" {
  name                = "ntier_nic"
  location            = "eastus"
  resource_group_name = "ntier"

  ip_configuration {
    name                          = "ntier_nic_ipc"
    subnet_id                     = data.azurerm_subnet.default_sub.id
    public_ip_address_id          = azurerm_public_ip.webip.id
    private_ip_address_allocation = "Dynamic"


  }
}
resource "azurerm_network_interface_security_group_association" "ncisg" {
  network_interface_id      = azurerm_network_interface.ntier_nic.id
  network_security_group_id = data.azurerm_network_security_group.openall.id
}
resource "azurerm_linux_virtual_machine" "apache2" {
  name                            = "apache2"
  resource_group_name             = "ntier"
  location                        = "eastus"
  size                            = "Standard_B1s"
  admin_password                  = "Ab@1060871348"
  admin_username                  = "abhish9416"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.ntier_nic.id]
  source_image_reference {
    offer     = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  #  custom_data = filebase64("apache.sh")

}
resource "null_resource" "rollout" {
  triggers = {
    rollout_version = var.rollout
  }
    connection {
    user     = azurerm_linux_virtual_machine.apache2.admin_username
    password = azurerm_linux_virtual_machine.apache2.admin_password
    type     = "ssh"
    host     = azurerm_linux_virtual_machine.apache2.public_ip_address
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install apache2 -y",
      "sudo apt install openjdk-11-jdk -y"
    ]
  }
  
}