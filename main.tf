terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "8fdbe427-da5f-48ee-9c0f-bb1366307498"
  tenant_id = "528f4d7d-391c-41df-a035-cbee5eaf75b1"
  client_id = "e04257a1-33fc-41cc-a5a3-30a99624beea"
  client_secret = "jFl8Q~Sc7-_ZaU98sH27vlgPvoNlSpckmWZJ6dkv"

    features {
      
    }

}

locals {
  resource_group_name = "AAAEASTUS2-RG01"
  location = "EAST US 2"
}

resource "azurerm_resource_group" "AAAEASTUS2-RG01" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_virtual_network" "AAAVNET-01" {
  name                = "AAAVNET-01"
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = ["10.0.0.0/16"]
  
  depends_on = [ "azurerm_resource_group.AAAEASTUS2-RG01" ]

  
  }