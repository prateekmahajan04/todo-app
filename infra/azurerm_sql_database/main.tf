data "azurerm_mssql_server" "serverid" {
  name                = "prattodosqlserver"
  resource_group_name = var.rg
}


resource "azurerm_mssql_database" "sql_database" {
  name         = var.sqldb_name
  server_id    = data.azurerm_mssql_server.serverid.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = var.sqldb_max_size_gb
  sku_name     = var.sqldb_sku_name
  enclave_type = var.sqldb_enclave_type
}