variable "frontend_subnet_name" {
  description = "The name of the frontend subnet."
  type        = string
  
}
variable "backend_subnet_name" {
  description = "The name of the backend subnet."
  type        = string 
  
}
variable "frontend_address_prefixes" {
  description = "The address prefixes for the frontend subnet."
  type        = list(string)
}
variable "backend_address_prefixes" {
  description = "The address prefixes for the backend subnet."
  type        = list(string)
}
variable "rg" {
  description = "The name of the resource group."
  type        = string
}
variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  
}
