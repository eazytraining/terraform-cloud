
#Block Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#Block Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

#Declaration des block de ressources AWS
resource "aws_instance" "vm" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    key_name = "terraformcloud"
  tags = {
    Name = "vm-ulrich"
  }
}