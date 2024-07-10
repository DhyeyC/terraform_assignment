output "vnet_name" {
  value = azurerm_virtual_network.network_n1918.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.network_n1918.address_space
}

output "subnet_name" {
  value = azurerm_subnet.subnet1918.name
}

output "subnet_address_prefix" {
  value = azurerm_subnet.subnet1918.address_prefixes
}

output "subnet_id" {
  value = azurerm_subnet.subnet1918.id
}

output "nsg_name" {
  value = azurerm_network_security_group.n1918-nsg.name
}
