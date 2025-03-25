# module "aks" {
#   source = "./modules/aks"
#   env = var.env
# }

module "vms" {
  for_each = var.vms
  source = "./modules/vm"
  env = dev
  vm_size = each.value["vm_size"]
  vms = each.value["name"]
}