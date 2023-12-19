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

variable "app_name" {
  description = "Name of application"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}


resource "azurerm_resource_group" "project1" {
  name     = upper(format("RG-%s-%s",var.app_name,var.environment))
  location = "asia"
}