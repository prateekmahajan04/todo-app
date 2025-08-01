variable "nic_name_1" {
  description = "The name of the first network interface."
  type        = string
}

variable "nic_name_2" {
  description = "The name of the second network interface."
  type        = string
}

variable "frontend_vm_name" {
  description = "The name of the frontend virtual machine."
  type        = string
}

variable "backend_vm_name" {
  description = "The name of the backend virtual machine."
  type        = string
}

variable "frontend_vm_size" {
  description = "The size of the frontend virtual machine."
  type        = string
  default     = "Standard_F2"
}

variable "frontend_vm_admin_username" {
  description = "The admin username for the frontend virtual machine."
  type        = string
}

variable "frontend_vm_admin_password" {
  description = "The admin password for the frontend virtual machine."
  type        = string
  sensitive   = true
}

variable "backend_vm_admin_username" {
  description = "The admin username for the backend virtual machine."
  type        = string
}

variable "backend_vm_admin_password" {
  description = "The admin password for the backend virtual machine."
  type        = string
  sensitive   = true
}

variable "backend_vm_size" {
  description = "The size of the backend virtual machine."
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

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "security_rule_name" {
  description = "Name of the security rule"
  type        = string
}

variable "direction" {
  description = "Direction of the security rule (Inbound/Outbound)"
  type        = string
}

variable "access" {
  description = "Access type for the security rule (Allow/Deny)"
  type        = string
}

variable "protocol" {
  description = "Protocol for the security rule (TCP/UDP/Asterisk)"
  type        = string
}
