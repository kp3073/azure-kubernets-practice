resource "azurerm_kubernetes_cluster" "example" {
  name                = "${var.env}-aks"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "cloudaws"

  default_node_pool {
	name           = "nodepool1"
	node_count     = 3
	vm_size        = "Standard_D2_v2"
	vnet_subnet_id = data.azurerm_subnet.subnet.id
  }

  identity {
	type = "SystemAssigned"
  }
  network_profile {
	network_plugin     = "azure"
	service_cidr = "10.3.0.0/16"  # Updated service CIDR to avoid conflict
  }

  tags = {
	Environment = "Production"
  }
}