terraform {
  required_version = "~> 1.1"
  required_providers {
    azurerm = {
      version = "~> 3.85.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "aaaa-aaa-aaaaa-aaaaa"
    alias = "project1-sub"
    features{

    }
}

provider "azurerm" {
    subscription_id = "bbbb-bbb-bbbbb-bbbbb"
    alias = "project2-sub"
    features{

    }
}

resource "azurerm_resource_group" "project1_res"{
    provider = azurerm.project1-sub
    name = "resgroup-project1"
    location = "asia-south-east"
}

resource "azurerm_resource_group" "project2_res"{
    provider = azurerm.project2-sub
    name = "resgroup-project2"
    location = "asia-south-east"
}