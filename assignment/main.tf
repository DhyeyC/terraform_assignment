# Module for Resource Group
module "rgroup" {
  source              = "./modules/rgroup-n01581918"
  resource_group_name = "n01581918-RG"
  location            = "East US"
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "dhyey.chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

# Module for Virtual Network
module "network" {
  source              = "./modules/network-n01581918"
  vnet_name           = "n01581918-VNET"
  subnet_name         = "n01581918-SUBNET"
  location            = "East US"
  vnet_address_space    = ["10.0.0.0/16"]
  subnet_address_prefix = ["10.0.1.0/24"]
  nsg_name              = "n59360-nsg"
  resource_group_name = module.rgroup.resource_group_name
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "dhyey.chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}


# Module for Common Services
module "common" {
  source                       = "./modules/common-n01581918"
  recovery_services_vault_name = "n01581918-recovery"
  storage_account_name         = "n01581918storage"
  location                     = "East US"
  resource_group_name          = module.rgroup.resource_group_name
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "dhyey.chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

#module for vmlinux 
module "vmlinux_n1918" {
  source                                = "./modules/vmlinux-n01581918" 
  availability_set_name                 = "n1918-linux-avset"
  location                              = module.rgroup.location        
  resource_group_name                   = module.rgroup.resource_group_name
  vm_names                              = { "linux-vm1" = "linux-vm1dns", "linux-vm2" = "linux-vm2dns", "linux-vm3" = "linux-vm3dns" }
  admin_username                        = "admin_user"
  subnet_id                             = module.network.subnet_id      
  boot_diagnostics_storage_account_uri  = module.common.storage_account_primary_blob_endpoint
}


# Module for Windows Virtual Machines
module "vmwindows_n01581918" {
  source                          = "./modules/vmwindows-n01581918"
  availability_set_name           = "n1918-windows-avset"
  location                        = module.rgroup.location
  resource_group_name             = module.rgroup.resource_group_name
  admin_password                  = "Humber@2024"
  admin_username                  = "admin_user"
  subnet_id                       = module.network.subnet_id
  boot_diagnostics_storage_account_uri = module.common.storage_account_primary_blob_endpoint
  storage_account_type            = "Standard_LRS"
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "dhyey.chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
 }

# Module For Datadisk 
module "datadisk" {
  source              = "./modules/datadisk-n01581918"
  location            = module.rgroup.location
  resource_group_name = module.rgroup.resource_group_name
  vm_ids              = concat(module.vmlinux_n1918.vm_ids, [module.vmwindows_n01581918.vm_id]) 
  disk_names          = ["datadisk1", "datadisk2", "datadisk3", "datadisk4"]
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "dhyey.chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

#Module for loadbalancer 

module "loadbalancer" {
  source              = "./modules/loadbalancer-n01581918"
  location            = module.rgroup.location
  resource_group_name = module.rgroup.resource_group_name
  load_balancer_name  = "n01581918-lb"
  vm_nic_ids          = module.vmlinux_n1918.vm_nic_ids
  tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "dhyey.chauhan"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

#module for database 

module "database" {
  source              = "./modules/database-n01581918"
  resource_group_name = module.rgroup.resource_group_name
  location            = module.rgroup.location
  db_username         = "username"
  db_password         = "Humber@2024"
}
