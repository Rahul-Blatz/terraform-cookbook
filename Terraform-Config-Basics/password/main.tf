terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      version = "~> 3.85.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "project1rg" {
  name     = "myResourceGroup-demo"
  location = "asia"
}

# Create virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = "myVnet-demo"
  address_space       = ["10.0.0.0/16"]
  location            = "asia"
  resource_group_name = azurerm_resource_group.project1rg.name
}

# Create subnet
resource "azurerm_subnet" "myterraformsubnet" {
  name                 = "mySubnet-demo"
  resource_group_name  = azurerm_resource_group.project1rg.name
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "myterraformpublicip" {
  name                = "myPublicIP-demo"
  location            = "asia"
  resource_group_name = azurerm_resource_group.project1rg.name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "myterraformnsg" {
  name                = "myNetworkSecurityGroup-demo"
  location            = "asia"
  resource_group_name = azurerm_resource_group.project1rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "myterraformnic" {
  name                = "myNIC-demo"
  location            = "asia"
  resource_group_name = azurerm_resource_group.project1rg.name

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = azurerm_subnet.myterraformsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
  }
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "myterraformvm" {
  name                            = "myVM"
  location                        = "asia"
  resource_group_name             = azurerm_resource_group.project1rg.name
  network_interface_ids           = [azurerm_network_interface.myterraformnic.id]
  disable_password_authentication = false
  computer_name                   = "vmdemo"
  admin_username                  = "uservm"
  admin_password                  = random_password.password.result
  size                            = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "19.04"
    version   = "latest"
  }
}