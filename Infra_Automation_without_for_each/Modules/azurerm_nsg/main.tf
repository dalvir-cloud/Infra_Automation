variable "nsg_name" {}
variable "rg_name" {}
variable "location" {}
variable "tags" {}

resource "azurerm_network_security_group" "example" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
}