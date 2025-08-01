data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "pratkv" {
  name                       = var.kv_name
  location                   = var.location
  resource_group_name        = var.rg
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = var.kv_soft_delete_retention_days

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}

resource "azurerm_key_vault_secret" "vm_admin_username" {
  name         = "vmadminuser"
  value        = var.vmadminusername
  key_vault_id = azurerm_key_vault.pratkv.id
}

resource "azurerm_key_vault_secret" "vm_admin_password" {
  name         = "vmadminpassword"
  value        = var.vmadminpassword
  key_vault_id = azurerm_key_vault.pratkv.id
}


