#Terraform Provider Block

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
      configuration_aliases = [ aws.alternate ]
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}