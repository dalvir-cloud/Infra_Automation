locals {
  common_tags = {
    Environment = "Dev"
    config_tool = "Terraform"
    project     = "B16FinalProject"
  }
}


module "rg" {
  source   = "../../Modules/azurerm_resource_group"
  rg_name  = "b16_rgdev"
  location = "central india"
  tags     = local.common_tags
}

module "stg" {
  source     = "../../Modules/azurerm_storage_account"
  depends_on = [module.rg]
  stg_name   = "b16stgdev"
  rg_name    = "b16_rgdev"
  location   = "central india"
  tags       = local.common_tags
}

module "vnet" {
  source     = "../../Modules/azurerm_virtual_network"
  depends_on = [module.rg]
  vnet_name  = "b16-vnetdev"
  rg_name    = "b16_rgdev"
  location   = "central india"
  tags       = local.common_tags
}

module "subnet" {
  source      = "../../Modules/azurerm_subnet"
  depends_on  = [module.vnet]
  subnet_name = "b16-subnetdev"
  rg_name     = "b16_rgdev"
  vnet_name   = "b16-vnetdev"
}

# module "subnet_data" {
#   source     = "../../Modules/azurerm_nic/data.tf"
#   subnet_name = "b16-subnetdev"
#   rg_name    = "b16_rgdev"
#   vnet_name  = module.vnet.vnet_name
# }

module "nsg" {
  source     = "../../Modules/azurerm_nsg"
  depends_on = [module.rg]
  nsg_name   = "b16-nsgdev"
  rg_name    = "b16_rgdev"
  location   = "central india"
  tags       = local.common_tags
}


module "virtual_machine" {
  source           = "../../Modules/azurerm_virtual_machine"
  depends_on       = [module.rg, module.vnet, module.subnet]
  rg_name          = "b16_rgdev"
  location         = "central india"
  nic_name         = "b16-nicdev"
  vm_name          = "b16-vmdev"
  subnet_data_name = "b16-subnetdev"
  vnet_name        = "b16-vnetdev"
  kv_name          = "b16-kvdev"
  usernamesecretname    = "usernamesecretname"
  usernamesecretpassword = "usernamesecretpassword"
}


module "acr" {
  source     = "../../Modules/azurerm_azure_container_registry"
  depends_on = [module.rg]
  acr_name   = "acrdevb16"
  rg_name    = "b16_rgdev"
  location   = "central india"
  tags       = local.common_tags
}

module "sql_server" {
  source          = "../../Modules/azurerm_sql_server"
  depends_on      = [module.rg]
  sql_server_name = "b16-sqldevkljjghjh65"
  rg_name         = "b16_rgdev"
  location        = "west us"
  kv_name        = "b16-kvdev"
  usernamesecretkvname     = "usernamesecretkvname"
  usernamesecretpassword = "usernamesecretpassword"
  tags            = local.common_tags
}

module "sql_database" {
  source        = "../../Modules/azurerm_sql_database"
  depends_on    = [module.sql_server]
  sqldb_name    = "b16-sqldev-db"
  sql_server_id = module.sql_server.sql_server_id
  tags          = local.common_tags
}

module "kv" {
  source     = "../../Modules/azurerm_keyvault"
  depends_on = [module.rg]
  kv_name    = "b16-kvdev"
  rg_name    = "b16_rgdev"
  location   = "central india"
}

module "aks" {
  source     = "../../Modules/azurerm_kubernetes_cluster"
  depends_on = [module.rg]
  k8s_name   = "b16-aksdev"
  location   = "central india"
  rg_name    = "b16_rgdev"
  dns_prefix = "b16aksdev"
  tags       = local.common_tags

}