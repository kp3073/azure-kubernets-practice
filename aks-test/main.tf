module "aks" {
  source = "./modules/aks"
  env = var.env
}

module "vms" {
  source = "./modules/vm"
  vms = var.vms
  env = dev
}