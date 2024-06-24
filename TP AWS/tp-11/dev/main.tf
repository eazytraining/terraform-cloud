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
  access_key = "AKIA5OYEFMPB2ENZRQW4"
  secret_key = "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"
}


module "ec2" {
  source = "../modules/ec2modules"
  instancetype = "t2.nano"
  name = "ec2-dev-ulrich"
}