terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
}

terraform {
  cloud {
    organization = "eazytraining-organisation"

    workspaces {
      name = "eazytraining-workspace"
    }
  }
}

resource "aws_instance" "myec2" {
  ami           = "ami-0c7217cdde317cfec" #
  instance_type = "t3.micro"
  key_name      = "terraformcloud"
  tags = {
    Name = "ec2-franklin"
  }
}