variable "resource_group_name" {
  description = "The name of the resource group where the PostgreSQL server will be deployed."
}

variable "location" {
  description = "The location for the PostgreSQL server."
}

variable "db_username" {
  description = "The administrator login for PostgreSQL server."
}

variable "db_password" {
  description = "The administrator login password for PostgreSQL server."
}
