terraform {
  required_version = ">= 1.11.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
  # Il est DANGEREUX de mettre les clés en dur dans le code !
  # Utilisez plutôt :
  # - Variables d'environnement (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
  # - Un fichier de configuration AWS (par exemple, ~/.aws/credentials)
  # - Un profil AWS configuré dans le fichier ~/.aws/config
  # - awscli pour configurer les clés
  # - Un fichier de configuration AWS partagé
  # - Un secret manager comme AWS Secrets Manager
}
terraform {
  backend "s3" {
    region = "us-east-1"
    access_key = "PUT YOUR OWN"
    secret_key = "PUT YOUR OWN"
    bucket = "terraform-backend-ulrich"
    key = "terraformcloud.tfstate"
  }
}

