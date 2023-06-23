#terraform {
#  required_providers {
#    azurerm = {
#      source          = "hashicorp/azurerm"
#      version         = "=3.0.0"
#    }
#  }
#}
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