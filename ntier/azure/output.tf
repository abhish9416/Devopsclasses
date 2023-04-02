output "apacheurl" {
  value = "http://${azurerm_linux_virtual_machine.apache2.public_ip_address}"
}