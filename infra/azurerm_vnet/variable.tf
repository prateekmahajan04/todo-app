variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  
}
variable "vnet_address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}
variable "rg" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
}