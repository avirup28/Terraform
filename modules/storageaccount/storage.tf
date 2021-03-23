resource "azurerm_storage_account" "newstorageaccount" {
  name                     = lower(local.StorageAcc_Name)
  resource_group_name      = var.rgname
  location                 = var.rgloc
  account_tier             = local.tier
  account_replication_type = var.replicationtype
  }