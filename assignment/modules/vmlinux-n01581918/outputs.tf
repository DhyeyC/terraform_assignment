output "linux_vm_hostname" {
  value = [for vm in azurerm_linux_virtual_machine.n01581918-vm : vm.computer_name]
}

output "vm_dns_labels" {
  value = [for pip in azurerm_public_ip.n1918_pip : pip.domain_name_label]
}

output "linux_private_ip_address" {
  value = [for nic in azurerm_network_interface.n1918-nic : nic.private_ip_address]
}

output "linux_public_ip_address" {
  value = [for pip in azurerm_public_ip.n1918_pip : pip.ip_address]
}

output "vm_nic_ids" {
  description = "List of NIC IDs for the Linux VMs"
  value = [for nic in azurerm_network_interface.n1918-nic : nic.id]
}

output "vm_ids" {
  description = "List of VM IDs for the Linux VMs"
  value = [for vm in azurerm_linux_virtual_machine.n01581918-vm : vm.id]
}
