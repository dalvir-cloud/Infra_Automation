variable "stgs" {}

resource "azurerm_storage_account" "stgs" {
    for_each = var.stgs
  name                     = each.value.stg_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.rg_location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}