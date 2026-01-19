terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }

}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "202d4be6-e0dd-4b9e-84b7-e235d53271a8"
}

resource "azurerm_resource_group" "myrg" {
  name = "myazuredemorg"
  location = "centralIndia"
  tags = { Env = "Dev" }

}

resource "azurerm_virtual_network" "myvnet1" {
  name = "myazurevnet"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_subnet" "mysubnet1" {
  name = "myazuresubnet"
  address_prefixes = ["10.0.1.0/24"]
  resource_group_name = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet1.name
}