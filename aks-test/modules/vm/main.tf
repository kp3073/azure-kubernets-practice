resource "azurerm_network_interface" "main" {
  for_each 			  = var.vms
  name                = "${var.env}-${each.value["name"]}-nic"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
	name                          = "internal"
	subnet_id                     = data.azurerm_subnet.subnet.id
	private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  for_each            = var.vms
  name                = "${var.vms}-${var.env}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size = each.value["vm_size"]

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true


  storage_image_reference {
	id = "/subscriptions/4b236e6d-2c9a-4cb2-90a2-30a5377d8eb2/resourceGroups/azuredevops/providers/Microsoft.Compute/galleries/azawsdevops/images/azawsdevops/versions/1.0.0"
  }

  storage_os_disk {
	name              = "${var.vms}-${var.env}"
	caching           = "ReadWrite"
	create_option     = "FromImage"
	managed_disk_type = "Standard_LRS"
  }
  os_profile {
	computer_name  = var.vms
	admin_username = "cenetos"
	admin_password = "Password1234$$$$"
  }
  os_profile_linux_config {
	disable_password_authentication = false
  }
  tags = {
	database = "${var.vms}-${var.env}"
  }
}