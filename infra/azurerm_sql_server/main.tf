resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sqlservername
  resource_group_name          = var.rg
  location                     = var.location
  version                      = var.sqlserver_version
  administrator_login          = var.sqlserver_administrator_login
  administrator_login_password = var.sqlserver_administrator_login_password
  minimum_tls_version          = var.sqlserver_minimum_tls_version
}
