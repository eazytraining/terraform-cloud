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
  access_key = "AKIA5OYEFMPB2ENZRQW4"
  secret_key = "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"
}

resource "aws_instance" "vm" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = var.instance_type
    key_name = "terraformcloud"
  tags = {
    Name = var.name
  }
}