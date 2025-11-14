data "azurerm_subnet" "subnet_data" {
  name                 = var.subnet_data_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

data "azurerm_key_vault" "kv_data" {
  name                = var.kv_name
  resource_group_name = var.rg_name
}

data "azurerm_key_vault_secret" "username" {
  name         = var.usernamesecretname
  key_vault_id = data.azurerm_key_vault.kv_data.id
}
 
data "azurerm_key_vault_secret" "password" {
  name         = var.usernamesecretpassword
  key_vault_id = data.azurerm_key_vault.kv_data.id
}
