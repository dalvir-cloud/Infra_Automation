resource "azurerm_storage_account" "stg" {
  for_each = var.stg_name
  name                     = each.value.stg_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = each.value.tags
}