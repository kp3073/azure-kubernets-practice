resource "azurerm_resource_group" "rg" {
  location = data.azurerm_resource_group.rg.location
  name     = data.azurerm_resource_group.rg.name
}

