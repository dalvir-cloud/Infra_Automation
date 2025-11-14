data "azurerm_subnet" "subnet_data" {
    for_each = var.vms
    name                 = each.value.subnet_data_name
    virtual_network_name = each.value.vnet_name
    resource_group_name  = each.value.rg_name
}

data "azurerm_key_vault" "kv_data" {
    # for_each = var.vms
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "username" {
    # for_each = var.vms
  name         = each.value.usernamesecretname
  key_vault_id = data.azurerm_key_vault.kv_data.id
}
 
data "azurerm_key_vault_secret" "password" {
    # for_each = var.vms
  name         = each.value.usernamesecretpassword
  key_vault_id = data.azurerm_key_vault.kv_data.id
}
