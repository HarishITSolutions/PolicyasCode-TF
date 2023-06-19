data "azurerm_resource_group" "this" {


}

// data "azurerm_subnet" "management" {
//   name                 = var.vm_subnet_name
//   virtual_network_name = var.vnet_name
//   resource_group_name  = var.vnet_resource_group_name
// }

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
    assignment_reference = "DefaultRG"
    category             = "Mitigated"
    id                   = data.azurerm_resource_group.this.id
    risk_id              = "R-001"
    scope                = "rg"
  }]

  environment           = "dev"
  initiative_definition = format("%s/initiatives/core.yaml", path.module)
}