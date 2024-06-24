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
dynamic "ingress" {
  for_each = var.sg_ports
  iterator = port
  content {
     from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

dynamic "egress" {
  for_each = var.sg_ports
  iterator = port
  content {
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
}