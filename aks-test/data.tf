data "azurerm_resource_group" "rg" {
  name = "azuredevops"
}

data "azurerm_virtual_network" "vnet" {
  name                = "azure-network"
  resource_group_name = "azuredevops"
}
data "azurerm_subnet" "subnet" {
  name                 = "default"
  virtual_network_name = "azure-network"
  resource_group_name  = "azuredevops"
}

output "subnet_id" {
  value = data.azurerm_subnet.subnet.id
}