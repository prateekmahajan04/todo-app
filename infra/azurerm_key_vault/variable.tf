variable "kv_name" {
  description = "The name of the Key Vault."
  type        = string
}
variable "kv_secret_name" {
  description = "The name of the Key Vault secret."
  type        = string
  }

variable "kv_secret_value" {
  description = "The value of the Key Vault secret."
  type        = string
    }
variable "kv_soft_delete_retention_days" {
  description = "The number of days to retain soft-deleted secrets in the Key Vault."
  type        = number
}
variable "rg" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string
}


variable "vmadminusername" {
  description = "The admin username for the virtual machine."
  type        = string
  
}
variable "vmadminpassword" {
  description = "The admin password for the virtual machine."
}