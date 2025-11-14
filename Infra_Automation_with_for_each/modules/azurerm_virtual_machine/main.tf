
resource "azurerm_network_interface" "nic" {
    for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.pip_name
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "vms" {
    for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault.kv_data.id.value
  admin_password      = data.azurerm_key_vault.kv_data.id.value
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  disable_password_authentication = "true"
#   admin_ssh_key {
#     username   = "adminuser"
#     public_key = file("C:/Users/Advik/.ssh/id_rsa.pub")
#   }

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