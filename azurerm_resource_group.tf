locals {
  resource_group_name = format("%s_rg", local.name)
}

resource "azurerm_resource_group" "hub" {
  name     = local.resource_group_name
  location = var.location
}