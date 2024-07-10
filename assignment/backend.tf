terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01581918RG"
    storage_account_name = "tfstaten01581918sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}
