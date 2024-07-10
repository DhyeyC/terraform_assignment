variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "n01581918-RG"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "Central Canada"  # You can change the default location as needed
}

variable "tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "dhyey.chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
