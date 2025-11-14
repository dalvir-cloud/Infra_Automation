

data "azurerm_key_vault" "kv_data" {
  name                = var.kv_name
  resource_group_name = var.rg_name
}

data "azurerm_key_vault_secret" "username" {
  name         = var.usernamesecretkvname
  key_vault_id = data.azurerm_key_vault.kv_data.id
}
 
data "azurerm_key_vault_secret" "password" {
  name         = var.usernamesecretpassword
  key_vault_id = data.azurerm_key_vault.kv_data.id
}



resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.username.value
  administrator_login_password = data.azurerm_key_vault_secret.password.value
  minimum_tls_version          = "1.2"
  tags = var.tags
}