
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

variable "vm_names" {
  description = "Map of VM names and their corresponding unique DNS labels"
  type        = map(string)
}


variable "admin_username" {
  description = "Admin username for the VMs"
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

variable "public_key" {
  description = "Public key for SSH"
  default     = "/home/n01581918/.ssh/id_rsa.pub"
}

variable "priv_key" {
  description = "private key for SSH"
  default     = "/home/n01581918/.ssh/id_rsa"
}

variable "os_info" {
  description = "Info Linux OS"
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
}

variable "os_disk" {
  description = "Attributes of OS disk"
  default = {
    managed_disk_type    = "Standard_LRS"
    caching              = "ReadWrite"
  }
}


variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "dhyey.chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
