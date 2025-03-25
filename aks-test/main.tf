module "aks" {
  source = "./modules/aks"
  env = var.env
}

module "vms" {
  source = "./modules/vm"
  for_each = var.vms
  env = var.env
  vm_size = each.value["vm_size"]
  vms = each.value["name"]
}