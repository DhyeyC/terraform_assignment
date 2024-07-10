variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vm_ids" {
  description = "List of VM IDs to attach the disks to"
  type        = list(string)
}

variable "disk_names" {
  description = "List of disk names"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
