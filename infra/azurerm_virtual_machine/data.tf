data "azurerm_public_ip" "fepublicipdata" {
  name                = "pratTodoFrontendPublicIP"
  resource_group_name = "pratTodoRG"
}
data "azurerm_public_ip" "bepublicipdata" {
  name                = "pratTodoBackendPublicIP"
  resource_group_name = "pratTodoRG"
}

data "azurerm_subnet" "frontend_sn" {
  name                 = "pratTodoFrontendSubnet"
  virtual_network_name = "pratTodoVnet"
  resource_group_name  = "pratTodoRG"
}
data "azurerm_subnet" "backend_sn" {
  name                 = "pratTodoBackendSubnet"
  virtual_network_name = "pratTodoVnet"
  resource_group_name  = "pratTodoRG"
}
