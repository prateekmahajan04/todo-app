
resource "azurerm_subnet" "frontend_subnet" {
  name                 = var.frontend_subnet_name
  resource_group_name  = var.rg
  virtual_network_name = var.vnet_name
  address_prefixes     = var.frontend_address_prefixes
}

resource "azurerm_subnet" "backend_subnet" {
  name                 = var.backend_subnet_name
  resource_group_name  = var.rg
  virtual_network_name = var.vnet_name
  address_prefixes     = var.backend_address_prefixes
}
