terraform {
  required_version = ">= 0.12"
}

provider "azurerm" {
  version = "~> 2.27"
  features {}
}

provider "random" {
  version = "~> 2.3"
}

