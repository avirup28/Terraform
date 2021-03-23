terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "random" {
  source = "./modules/random"
}

module "resourcegroup" {
  source = "./modules/resourcegroup"

  app_name = var.app_name

}

module "storage" {
  source = "./modules/storageaccount"

  app_name        = var.app_name
  env             = var.env
  account_tier    = var.account_tier
  replicationtype = var.replicationtype
  random          = module.random.random
  rgname          = module.resourcegroup.rgname
  rgloc           = module.resourcegroup.rgloc

}
