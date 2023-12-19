terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      version = "~> 3.85.0"
    }
  }
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The name of the Azure location"
  default     = "asia"
  type        = string
  validation {
    condition     = contains(["asia-south-east", "asia"], var.location)
    error_message = "The location must be asia or asia-south-east."
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}