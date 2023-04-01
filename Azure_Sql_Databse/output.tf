output "appserverip" {
    value = azurerm_linux_virtual_machine.appserver.private_ip_address
  
}