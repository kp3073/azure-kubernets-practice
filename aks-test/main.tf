
resource "azurerm_kubernetes_cluster" "example" {
  name                = "${var.env}-aks"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "cloudaws"
  

  default_node_pool {
	name       = "test-np"
	node_count = 2
	vm_size    = "Standard_D2_v2"
	vnet_subnet_id = data.azurerm_subnet.subnet.id
  }

  tags = {
	Environment = "Production"
  }
}


output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

}