terraform {
  backend "azurerm" {
    subscription_id          = "37ed9c9a-0d39-4823-a06c-e8121b935f89"
    resource_group_name      = "Testresourcegroup1"
    storage_account_name     = "tfstatestoracc"
    container_name           = "tfstatecontainer"
    key                      = "terraform.tfstate"
  }
}