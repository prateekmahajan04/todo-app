variable "sqldb_name" {
  description = "The name of the SQL database."
  type        = string
}
variable "sqldb_sku_name" {
  description = "The SKU name for the SQL database."
  type        = string
}
variable "sqldb_enclave_type" {
  description = "The enclave type for the SQL database."
  type        = string
  default     = "VBS"
}
variable "sqldb_max_size_gb" {
  description = "The maximum size of the SQL database in GB."

}
variable "rg" {
  description = "The name of the resource group."
  type        = string
}
