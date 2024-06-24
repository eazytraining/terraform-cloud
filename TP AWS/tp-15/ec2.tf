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
    organization = "terraformcloud98-org"

    workspaces {
      name = "terraformcloud98-workspace"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "vm" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = var.instance_type
    key_name = "terraformcloud"
  tags = {
    Name = var.name
  }
}