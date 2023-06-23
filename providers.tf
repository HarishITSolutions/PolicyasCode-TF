terraform {
  required_providers {
    azurerm = {
      source          = "hashicorp/azurerm"
      version         = "=3.0.0"
      subscription_id = "37ed9c9a-0d39-4823-a06c-e8121b935f89"
    }
  }
}
#provider "azurerm" {
#  features {
#    key_vault {
#      purge_soft_delete_on_destroy    = true
#      recover_soft_deleted_key_vaults = true
#    }
#  }
#}
data azurerm_client_config current {}

output current_client_config {
    value = data.azurerm_client_config.current
}