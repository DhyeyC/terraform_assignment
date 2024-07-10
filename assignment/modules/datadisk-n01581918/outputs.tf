output "disk_ids" {
  description = "IDs of the created managed disks"
  value       = azurerm_managed_disk.datadisk[*].id
}

output "disk_attachments" {
  description = "IDs of the disk attachments"
  value       = azurerm_virtual_machine_data_disk_attachment.disk_attachment[*].id
}
