resource "azurerm_public_ip" "prattodofepip" {
  name                = var.fepip_name
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = var.fepip_allocation_method


}
resource "azurerm_public_ip" "prattodobepip" {
  name                = var.bepip_name
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = var.bepip_allocation_method


}