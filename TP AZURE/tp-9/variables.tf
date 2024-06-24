# Créez un fichier variables.tf avec les variables
variable "instance_types" {
  description = "Liste des types d'instances disponibles"
  type        = list(string)
  default     = ["t2.micro", "t2.medium", "t2.large"]
}

variable "environment_tags" {
  description = "Map des tags d'environnement"
  type        = map(string)
  default = {
    dev     = "ec2-dev"
    staging = "ec2-staging"
    prod    = "ec2-prod"
  }
}

variable "security_rules" {
  description = "Règles de sécurité à appliquer au groupe de sécurité"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = [
    {
      name                       = "Allow_SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow_HTTP"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}