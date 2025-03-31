module "aks" {
  source = "./modules/aks"
  env = var.env
}
module "vms" {
  for_each = var.vms  # var.component is a map for all the components , if you want to deploy app with Terraform
  source      = "./modules/vm"
  vms         = each.value["name"]
  vm_size     = "Standard_B2s"
  env         = var.env
}