terraform {
  required_version = ">= 0.12"
}

provider "azurerm" {
  version = "~> 2.27"
  features {}
}

provider "azuread" {
  version = "~> 1.0.0"
}
