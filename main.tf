terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {
    organization = "NonationITServices"
    workspaces {
      name = "FinaltestWS"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "TerraformLabRG"
  location = "East US"
}

module "finaltestmodule" {
  source  = "app.terraform.io/NonationITServices/finaltestmodule/azurerm"
  version = "1.0.0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "pb87sdf89mn8j"
  environment          = "DEV"
  # insert required variables here
}
