terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
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

provider "aws" {
  region     = "us-east-1"
  access_key = "PUT YOUR OWN"
  secret_key = "PUT YOUR OWN"
}

resource "aws_instance" "vm" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    key_name = "terraformcloud"
    security_groups = [ aws_security_group.my_security_group.name ]
  tags = {
    Name = "vm-ulrich"
  }
}
resource "aws_eip" "ip" {
  instance = aws_instance.vm.id 
  domain = "vpc"
  
}

output "myip" {
  value = aws_eip.ip.public_ip
}

resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Security group allowing access to ports 22, 80, and 443"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}