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