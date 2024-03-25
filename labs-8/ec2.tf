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
#   access_key = "PUT YOUR OWN"
#   secret_key = "PUT YOUR OWN"
}

resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  domain   = "vpc"
}

output "myeip" {
  value = aws_eip.lb.public_ip
}

resource "aws_instance" "myec2" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t3.micro"
  key_name      = "terraformcloud"
  security_groups = [aws_security_group.my_security_group.name]
  tags = {
    Name = "ec2-franklin"
  }
}

variable "sg_ports" {
  type = list
  description = "list of ingress ports"
  default = [22, 80, 443]
}

resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "Security group allowing access to ports 22, 80, and 443"

dynamic "ingress" {
  for_each = var.sg_ports
  iterator = port
  content {
    from_port = port.value
    to_port = port.value
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
