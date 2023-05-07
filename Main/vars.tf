# Global Variables For Resources Deployment

# 1. Resource Group Variables

# To have local variables for the resources

variable "name" {
    type        = string
    default     = "Rishi"
}

variable "resource-location" {
    type        = string
    default     = "Australia East"
}

variable "Purpose" {
    type        = string
    default     = "L&D-Training"
}

variable "Client" {
    type        = string
    default     = "Cognizant-Servian"
}

variable "Email" {
    type        = string
    default     = "rishi.raj@servian.com"
}

variable "Owner" {
    type        = string
    default     = "Rishi"
}


# Below Variables are used to create virtual machine
variable "size" {
    type        = string
    default     = "Standard_A1_v2"
}

variable "username" {
    type        = string
    default     = "ubuntu"
}