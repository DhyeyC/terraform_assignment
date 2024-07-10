output "common_log_analytics_name" {
  description = "The name of the log analytics workspace"
  value       = azurerm_log_analytics_workspace.n1918-law.name
}

output "common_recovery_services_vault_name" {
  description = "The name of the recovery services vault"
  value       = azurerm_recovery_services_vault.n1918-rsv.name
}

output "common_storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.n1918-asa.name
}

output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.n1918-asa.primary_blob_endpoint
}
