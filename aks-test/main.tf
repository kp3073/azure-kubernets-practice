module "aks" {
  source = "./modules/aks"
  env = var.env
}


module "vm" {
  source = "./modules/vm"
  env = var.env
}