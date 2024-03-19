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
  # ami = "ami-0d71ca6a78e324f68" # centos7
  instance_type = "t3.medium"
  key_name      = "terraformcloud"
  security_groups = [aws_security_group.my_security_group.name]
  root_block_device {
    volume_size = 50
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.public_ip} > infos_ec2.txt"
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo apt update -y",
        "sudo sudo apt install nginx -y",
        "sudo systemctl start nginx"
     ]

     connection {
       type = "ssh"
       user = "ubuntu"
       private_key = file("./terraformcloud.pem")
       host = self.public_ip
     }
  }

  tags = {
    Name = "ec2-franklin"
  }
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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
