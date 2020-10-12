locals {
  azurerm_application_insights_name = format("%s-ai", local.name)
}

resource "azurerm_application_insights" "hub" {
  name                = local.azurerm_application_insights_name
  location            = azurerm_resource_group.hub.location
  resource_group_name = azurerm_resource_group.hub.name
  application_type    = "web"
}
