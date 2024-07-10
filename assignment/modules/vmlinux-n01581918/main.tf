# Create Availability Set
resource "azurerm_availability_set" "n1918-linux-avset" {
  name                = var.availability_set_name
  location            = var.location
  resource_group_name = var.resource_group_name
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
  managed = true
}

# Define the Public IP Addresses
resource "azurerm_public_ip" "n1918_pip" {
  for_each            = var.vm_names
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = each.value
}

# Create Network Interfaces
resource "azurerm_network_interface" "n1918-nic" {
  for_each            = var.vm_names
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.n1918_pip[each.key].id  
  }

  tags = var.tags
}

# Create Linux Virtual Machines
resource "azurerm_linux_virtual_machine" "n01581918-vm" {
  for_each            = var.vm_names
  name                = each.key
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1ms" # Replace with your desired size
  admin_username      = var.admin_username
  network_interface_ids = [azurerm_network_interface.n1918-nic[each.key].id]
  availability_set_id = azurerm_availability_set.n1918-linux-avset.id  
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  os_disk {
    name              = "${each.key}-osdisk"
    caching           = "ReadWrite"
     storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
 
  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_account_uri
  }

  tags = var.tags
}

# Extensions for VMs
resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each                 = azurerm_linux_virtual_machine.n01581918-vm
  name                     = "NetworkWatcherAgentLinux"
  virtual_machine_id       = each.value.id
  publisher                = "Microsoft.Azure.NetworkWatcher"
  type                     = "NetworkWatcherAgentLinux"
  type_handler_version     = "1.4"

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each                 = azurerm_linux_virtual_machine.n01581918-vm
  name                     = "AzureMonitorLinuxAgent"
  virtual_machine_id       = each.value.id
  publisher                = "Microsoft.Azure.Monitor"
  type                     = "AzureMonitorLinuxAgent"
  type_handler_version     = "1.7"

  tags = var.tags
}
