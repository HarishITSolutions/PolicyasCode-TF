provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "this" {
  name = "rg-policy"
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
    assignment_reference = "Testresourcegroup1"
    category             = "Mitigated"
    id                   = data.azurerm_resource_group.this.id
    risk_id              = "R-001"
    scope                = "rg"
  }]

  environment           = "dev"
  initiative_definition = format("%s/initiatives/core.yaml", path.module)
}