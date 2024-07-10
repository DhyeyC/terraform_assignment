variable "availability_set_name" {
  description = "Name of the availability set"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VMs"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "boot_diagnostics_storage_account_uri" {
  description = "URI of the storage account used for boot diagnostics"
  type        = string
}

variable "storage_account_type" {
  description = "Storage account type for OS disks"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}
