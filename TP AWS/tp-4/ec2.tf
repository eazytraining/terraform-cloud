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
  provisioner "remote-exec" {
    inline = [  
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx"
      #"sudo service nginx start"
     ]
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("./terraformcloud.pem")
      host = self.public_ip
    }
  }
}
resource "aws_eip" "ip" {
  instance = aws_instance.vm.id 
  domain = "vpc"
  provisioner "local-exec" {
    command ="echo PUBLIC IP: ${aws_eip.ip.public_ip} ; ID: ${aws_instance.vm.id} ; AZ: ${aws_instance.vm.availability_zone}; >> infos_ec2.txt"

  }
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