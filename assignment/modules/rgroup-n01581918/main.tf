resource "azurerm_resource_group" "rgroup-n1918" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}
