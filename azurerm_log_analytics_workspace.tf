locals {
  azurerm_log_analytics_workspace_name = format("%s-oms", local.name)
  keyvault_analytics_name              = format("KeyVaultAnalytics(%s)", azurerm_log_analytics_workspace.hub.name)
  adf_analytics_name                   = format("AzureDataFactoryAnalytics(%s)", azurerm_log_analytics_workspace.hub.name)
}

resource "azurerm_log_analytics_workspace" "hub" {
  name                = local.azurerm_log_analytics_workspace_name
  location            = azurerm_resource_group.hub.location
  resource_group_name = azurerm_resource_group.hub.name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_retention_days
}


resource "azurerm_log_analytics_solution" "hub_KeyVaultAnalytics" {
  solution_name         = "KeyVaultAnalytics"
  location              = azurerm_resource_group.hub.location
  resource_group_name   = azurerm_resource_group.hub.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/KeyVaultAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "hub_AzureDataFactoryAnalytics" {
  solution_name         = "AzureDataFactoryAnalytics"
  location              = azurerm_resource_group.hub.location
  resource_group_name   = azurerm_resource_group.hub.name
  workspace_resource_id = azurerm_log_analytics_workspace.hub.id
  workspace_name        = azurerm_log_analytics_workspace.hub.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureDataFactoryAnalytics"
  }
}
