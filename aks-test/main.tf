module "aks" {
  source = "./modules/aks"
  env = var.env
}
