locals {
  tier = lookup(var.account_tier, var.env) 
  StorageAcc_Name = format("%s%s%s", var.env, var.app_name, var.random)

}