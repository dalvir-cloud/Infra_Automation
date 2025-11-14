resource "azurerm_network_security_group" "nsgs" {
    for_each = var.nsgs
  name                = each.value.nsg_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name
}