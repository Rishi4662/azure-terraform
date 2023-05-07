# To Create Random Password

resource "random_password" "password" {
  length           = 16
  lower            = true
  upper            = true
  numeric          = true
  special          = false
}

# To Create Public-IP

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.name}-Public-IP"
  location            = var.resource-location
  resource_group_name = var.rg-name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.name}VM-NIC"
  location            = var.resource-location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = "${var.name}-ip-config"
    subnet_id                     = var.subnet-id
    public_ip_address_id          = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "my_vm" {
  name                  = "${var.name}-vm"
  location              = var.resource-location
  resource_group_name   = var.rg-name
  size                  = var.size
  network_interface_ids = [azurerm_network_interface.nic.id]
  computer_name         = "ubuntu"
  admin_username        = var.username
  admin_password        = "9905@Rishi"
  #random_password.password.result
  disable_password_authentication = false

  os_disk {
    name                 = "${var.name}-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
        Email    = var.Email
        Owner    = var.Owner
        Purpose  = var.Purpose
        Client   = var.Client
  }
}

output "vm_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "password" {
    value = azurerm_linux_virtual_machine.my_vm.admin_password
}
