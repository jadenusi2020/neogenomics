module "network" {
  source              = "../tf-modules/tf-network"
  prefix              = var.prefix
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  availability_zone   = var.availability_zone
}