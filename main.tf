terraform {
  backend "azurerm" {
    subscription_id          = "37ed9c9a-0d39-4823-a06c-e8121b935f89"
    resource_group_name      = "Testresourcegroup1"
    storage_account_name     = "tfstatestoracc"
    container_name           = "tfstatecontainer"
    key                      = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "this" {
  name = "Testresourcegroup1"
}

module "global_core" {
  source = "./modules/azure-policy-initiative"

  assignment = {
    assignments = [{
      id   = data.azurerm_resource_group.this.id
      name = "Testresourcegroup1"
    }]
    scope = "rg"
  }

  exemptions = [{
    assignment_reference = "Test"
    category             = "Mitigated"
    id                   = data.azurerm_resource_group.this.id
    risk_id              = "R-001"
    scope                = "rg"
  }]

  environment           = "dev"
  initiative_definition = format("%s/initiatives/core.yaml", path.module)
  initiative_definition2 = format("%s/initiatives/core2.yaml", path.module)
}