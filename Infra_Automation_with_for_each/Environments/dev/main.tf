module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rg_details
}


module "storage_account_details" {
  depends_on = [module.resource_group]
  source = "../../modules/azurerm_storage_account"
  stgs = var.storage_account_details
}


module "network_security_group" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm_nsg"
  nsgs = var.nsg_details
}


module "virtual_network" {
  depends_on = [ module.resource_group ]
source = "../../modules/azurerm_virtual_network"
vnets = var.vnet_details
}


module "subnet" {
  depends_on = [ module.resource_group, module.network_security_group, module.virtual_network ]
  source = "../../modules/azurerm_subnet"
  subnets = var.subnet_details
} 


# module "pip" {
#   depends_on = [ module.virtual_network, module.subnet ]
#   source = "../../modules/azurerm_public_ip"
#   pips = var.pip_details 
# }

module "vm" {
  depends_on = [ module.resource_group, module.virtual_network, module.subnet ]
  source = "../../modules/azurerm_virtual_machine"
  vms = var.vm_details
}

module "kv" {
  depends_on = [ module.resource_group ]
  source = "../../modules/azurerm_keyvault"
  kvs = var.kv_details
}