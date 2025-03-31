module "aks" {
  source = "./modules/aks"
  env = var.env
}


module "vm" {
  for_each = var.vms
  source = "./modules/vm"
  env = var.env
  name = each.value["name"]
  size = each.value["size"]
}