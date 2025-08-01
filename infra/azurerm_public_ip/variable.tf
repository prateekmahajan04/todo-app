variable "fepip_allocation_method" {
  
}
variable "fepip_name" {
  description = "Name of the public IP for the frontend VM"
  type        = string
}
variable "bepip_allocation_method" {
  
}
variable "bepip_name" {
  description = "Name of the public IP for the backend VM"
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