variable "subscription_id" {
  description = "The Subscription ID for the Azure resources."
  type        = string
}

variable "rg_details" {}
variable "storage_account_details" {}
variable "nsg_details" {}
variable "vnet_details" {}
variable "subnet_details" {}
variable "pip_details" {}
variable "vm_details" {}
variable "kv_details" {}