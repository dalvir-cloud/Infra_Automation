terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }

  }
  # backend "azurerm" {
  #   resource_group_name  = "mono-app-rg"
  #   storage_account_name = "monoappstg"
  #   container_name       = "blob"
  #   key                  = "terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "e68115ea-4d91-49bd-814a-4725aba743a1"
}