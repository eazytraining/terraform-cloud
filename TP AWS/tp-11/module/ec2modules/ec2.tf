resource "aws_instance" "vm" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = var.instancetype
    key_name = "terraform-cloud"
    security_groups = [ aws_security_group.my_security_group.name ]
  tags = {
    Name = var.name
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
      private_key = file("./terraform-cloud.pem")
      host = self.public_ip
    }
  }
}

resource "aws_security_group" "my_security_group" {
  name        = "${var.name}-sg"
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