resource "azurerm_mssql_server" "sqlserver" {
  name                         = "ntierdbserver"
  resource_group_name          = azurerm_resource_group.terraform.name
  location                     = azurerm_resource_group.terraform.location
  version                      = "12.0"
  administrator_login          = "abhish9416"
  administrator_login_password = "Abhish@9416"
  tags = {
    Env        = "Dev"
    Created_by = "Terraform"
  }
  depends_on = [
    azurerm_resource_group.terraform,
    azurerm_virtual_network.ntier,
    azurerm_subnet.websubnet
  ]
}
resource "azurerm_mssql_database" "sql_emp_id" {
  name      = "empid"
  server_id = azurerm_mssql_server.sqlserver.id
  //max_size_gb = "5"
  sku_name = "Basic"
  tags = {
    Env        = "Dev"
    Created_by = "Terraform"
  }
  depends_on = [
    azurerm_mssql_server.sqlserver
  ]
}