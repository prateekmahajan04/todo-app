variable "sqlservername" {
  description = "The name of the SQL server."
  type        = string
}

variable "sqlserver_version" {
  description = "The version of the SQL server."
  type        = string
 
}
  variable "sqlserver_administrator_login" {
    description = "The administrator login for the SQL server."
    type        = string
    
} 
variable "sqlserver_administrator_login_password" {
    description = "The administrator login password for the SQL server."
    type        = string


    
}
variable "sqlserver_minimum_tls_version" {
    description = "The minimum TLS version for the SQL server."
    type        = string
    
    
}
variable "rg" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
}