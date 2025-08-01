module "azurerm_resource_group" {
  source = "../infra/azurerm_resource_group"

  rg       = "pratTodoRG"
  location = "eastus"
}

module "azurerm_sql_server" {
  depends_on = [module.azurerm_resource_group]
  source     = "../infra/azurerm_sql_server"

  sqlservername                          = "prattodosqlserver"
  sqlserver_version                      = "12.0"
  sqlserver_administrator_login          = "missadministrator"
  sqlserver_administrator_login_password = "thisIsKat11"
  sqlserver_minimum_tls_version          = "1.2"
  rg                                     = "pratTodoRG"   # resource group name
  location                               = "eastus" # location

}
module "azurerm_sql_database" {
  depends_on         = [module.azurerm_sql_server]
  source             = "../infra/azurerm_sql_database"
  sqldb_name         = "pratTodoSqlDatabase"
  sqldb_sku_name     = "S0"
  sqldb_enclave_type = "VBS"
  sqldb_max_size_gb  = 2
  rg                 = "pratTodoRG" # resource group name

}
module "azurerm_virtual_network" {
  depends_on = [ module.azurerm_resource_group ]
  source             = "../infra/azurerm_vnet"
  vnet_name          = "pratTodoVnet"
  vnet_address_space = ["10.0.0.0/16"]
  rg                 = "pratTodoRG"   # resource group name
  location           = "eastus" # location
}
module "azurerm_subnet" {
  depends_on                = [module.azurerm_virtual_network]
  source                    = "../infra/azurerm_subnet"
  frontend_subnet_name      = "pratTodoFrontendSubnet"
  backend_subnet_name       = "pratTodoBackendSubnet"
  frontend_address_prefixes = ["10.0.2.0/24"]
  backend_address_prefixes  = ["10.0.3.0/24"]
  vnet_name                 = "pratTodoVnet"
  rg                        = "pratTodoRG" # resource group name

}
module "azurerm_virtual_machine" {
  depends_on                 = [module.azurerm_subnet, module.azurerm_key_vault, module.azurerm_public_ip, module.azurerm_resource_group]
  source                     = "../infra/azurerm_virtual_machine"
  nic_name_1                 = "pratTodoNic1"
  nic_name_2                 = "pratTodoNic2"
  frontend_vm_name           = "pratTodoFrontendVM"
  backend_vm_name            = "pratTodoBackendVM"
  frontend_vm_size           = "Standard_B1s"
  backend_vm_size            = "Standard_B1s"
  frontend_vm_admin_username = "adminuser"
  frontend_vm_admin_password = "Passw0rd@1234"
  backend_vm_admin_username  = "adminuser"
  backend_vm_admin_password  = "Passw0rd@1234"
  rg                         = "pratTodoRG"   # resource group name
  location                   = "eastus" # location
  nsg_name                   = "pratTodoNSG" # name of the network security group
  security_rule_name         = "AllowRDP"
  access                     = "Allow"
  protocol                   = "Tcp"
  direction                  = "Inbound"
}
module "azurerm_public_ip" {
  depends_on = [ module.azurerm_resource_group ]
  source                  = "../infra/azurerm_public_ip"
  rg                      = "pratTodoRG"   # resource group name
  location                = "eastus" # location
  fepip_name              = "pratTodoFrontendPublicIP"
  fepip_allocation_method = "Static"
  bepip_name              = "pratTodoBackendPublicIP"
  bepip_allocation_method = "Static"

}
module "azurerm_key_vault" {
  depends_on = [ module.azurerm_resource_group ]
  source         = "../infra/azurerm_key_vault"
  kv_name        = "pratTodoKeyVault"
  rg             = "pratTodoRG" # resource group name
  location       = "eastus" # location
  vmadminusername          = "adminuser"
  vmadminpassword          = "Passw0rd@1234" 
  kv_soft_delete_retention_days = 7
  kv_secret_name = "vmAdminUsername"
  kv_secret_value = "adminuser"
 
  }
