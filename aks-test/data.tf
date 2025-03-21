data "azurerm_resource_group" "rg" {
  name = "azuredevops"
}

data "azurerm_virtual_network" "vnet" {
  name                = "azure-network"
  resource_group_name = "azuredevops"
}