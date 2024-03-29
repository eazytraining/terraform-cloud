terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  cloud {
    organization = "eazytraining-organisation"

    workspaces {
      name = "eazytraining-workspace"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  #   access_key = "PUT YOUR OWN"
  #   secret_key = "PUT YOUR OWN"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0c7217cdde317cfec" 
  instance_type = var.instancetype
  key_name      = "terraformcloud"
  tags = {
    Name = var.aws_common_tag
  }
}




