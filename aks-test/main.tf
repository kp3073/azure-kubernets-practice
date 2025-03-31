module "aks" {
  source = "./modules/aks"
  env = var.env
}


module "vms" {
  for_each = var.vms
  source = "./modules/vms"
  env = var.env
}