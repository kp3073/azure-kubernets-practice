terraform {
  required_providers {
	azurerm = {
	  source  = "hashicorp/azurerm"
	  version = "4.24.0"
	}
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "4b236e6d-2c9a-4cb2-90a2-30a5377d8eb2"
}