provider "azurerm" {
  version                    = "=2.31.1"
  skip_provider_registration = true
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "local" {}

locals {
  name = format("%s%s%03d", var.prefix, var.suffix, var.instance)
}