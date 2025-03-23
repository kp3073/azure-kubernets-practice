resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
	name           = "default"
	node_count     = 1
	vm_size        = "Standard_D2_v2"
	vnet_subnet_id = data.azurerm_subnet.subnet.id
  }

  identity {
	type = "SystemAssigned"
  }

  tags = {
	Environment = "Production"
  }
}