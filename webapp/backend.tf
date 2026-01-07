terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-rg"
    storage_account_name = "tfstorage15"
    container_name       = "tfstate"
    key                  = "dev/appservice.tfstate"
  }
}
