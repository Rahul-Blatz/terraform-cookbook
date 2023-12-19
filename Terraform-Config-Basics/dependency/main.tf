terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      version = "~> 3.85.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rgdep"
  location = "asia"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = "asia"
  resource_group_name = "rgdep"
  address_space       = ["10.0.0.0/16"]

  depends_on = [azurerm_resource_group.rg]

}