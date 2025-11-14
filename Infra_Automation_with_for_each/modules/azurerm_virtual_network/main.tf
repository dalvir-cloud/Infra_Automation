

resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnets
  name                = each.value.vnet_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  
  tags = {
    environment = "Production"
  }
}