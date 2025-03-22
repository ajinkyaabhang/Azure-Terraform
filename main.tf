terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.24.0"
    }
  }
}

provider "azurerm" {
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
    features {
      
    }
}

resource "azurerm_resource_group" "rg" {
  name     = "myrg"
  location = "West Europe"
}

resource "azurerm_resource_group" "rg1" {
  name     = "myrg1"
  location = "West Europe"
}

resource "azurerm_storage_account" "ajstorage" {
  name                     = "aj251992"
  resource_group_name      = "myrg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  depends_on = [ azurerm_resource_group.rg ]

}

resource "azurerm_storage_account" "sonistorage" {
  name                     = "soni541995"
  resource_group_name      = "myrg1"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  depends_on = [ azurerm_resource_group.rg1 ]

}