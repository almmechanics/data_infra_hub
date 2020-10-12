locals {
  vnet_name = format("vnet%s", local.name)
}

resource "azurerm_virtual_network" "hub" {
  name                = local.vnet_name
  location            = azurerm_resource_group.hub.location
  resource_group_name = azurerm_resource_group.hub.name
  address_space       = [var.vnet_hub]

}
