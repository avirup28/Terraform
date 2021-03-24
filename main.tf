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

  app_name          = var.app_name
  resourcegroupname = var.resourcegroupname

}

module "storage" {
  source = "./modules/storageaccount"

  app_name        = var.app_name
  env             = var.env
  account_tier    = var.account_tier
  replicationtype = var.replicationtype
  random          = module.random.random
  rgname          = module.resourcegroup.rg
  rgloc           = module.resourcegroup.rgloc

}


terraform {
  backend "azurerm" {
    resource_group_name   = "rg1-test"
    storage_account_name  = "asmstorageacc"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
  }
}

