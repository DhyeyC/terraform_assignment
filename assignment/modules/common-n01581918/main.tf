	resource "azurerm_recovery_services_vault" "n1918-rsv" {
  name                = var.recovery_services_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard" 

  tags = var.tags
}

resource "azurerm_storage_account" "n1918-asa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "n1918-law" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018" 

  tags = var.tags
}

