
output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.rgroup.resource_group_name
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = module.network.vnet_name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = module.network.subnet_name
}

output "common_log_analytics_name" {
  description = "The name of the log analytics workspace"
  value       = module.common.common_log_analytics_name
}

output "common_recovery_services_vault_name" {
  description = "The name of the recovery services vault"
  value       = module.common.common_recovery_services_vault_name
}

output "common_storage_account_name" {
  description = "The name of the storage account"
  value       = module.common.common_storage_account_name
}

output "linux_vm_hostname" {
  description = "Hostnames of the Linux VMs"
  value       = module.vmlinux_n1918.linux_vm_hostname
}

output "linux_private_ip_address" {
  description = "Private IP addresses of the Linux VMs"
  value       = module.vmlinux_n1918.linux_private_ip_address
}

output "inux_public_ip_address" {
  description = "Public IP addresses of the Linux VMs"
  value       = module.vmlinux_n1918.linux_public_ip_address
}

output "vm_dns_labels" {
  description = "DNS labels assigned to the Linux VMs"
  value       = module.vmlinux_n1918.vm_dns_labels
}


