resource "azurerm_network_security_group" "pratnsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg

  security_rule {
    name                       = var.security_rule_name
    priority                   = 100
    direction                  = var.direction
    access                     = var.access
    protocol                   = var.protocol
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  
}
resource "azurerm_network_interface" "nic1" {
  name                = var.nic_name_1
  location            = var.location
  resource_group_name = var.rg

  ip_configuration {
    public_ip_address_id          = data.azurerm_public_ip.fepublicipdata.id
    name                          = "internal"
    subnet_id     = data.azurerm_subnet.frontend_sn.id

    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface_security_group_association" "nic1_nsg" {
  network_interface_id      = azurerm_network_interface.nic1.id
  network_security_group_id = azurerm_network_security_group.pratnsg.id
}
resource "azurerm_linux_virtual_machine" "frontend_virtual_machine" {
  name                = var.frontend_vm_name
  resource_group_name = var.rg
  location            = var.location
  size                = var.frontend_vm_size
  admin_username      = var.frontend_vm_admin_username
  admin_password      = var.frontend_vm_admin_password
  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]

disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = var.nic_name_2
  location            = var.location
  resource_group_name = var.rg

  ip_configuration {
    public_ip_address_id          = data.azurerm_public_ip.bepublicipdata.id
    name                          = "internal"
    subnet_id  = data.azurerm_subnet.backend_sn.id

    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface_security_group_association" "nic2_nsg" {
  network_interface_id      = azurerm_network_interface.nic2.id
  network_security_group_id = azurerm_network_security_group.pratnsg.id
}
resource "azurerm_linux_virtual_machine" "backend_virtual_machine" {
  name                = var.backend_vm_name
  resource_group_name = var.rg
  location            = var.location
  size                = var.backend_vm_size
  admin_username      = var.backend_vm_admin_username
  admin_password      = var.backend_vm_admin_password
  network_interface_ids = [
    azurerm_network_interface.nic2.id,
  ]

disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}