resource "aws_instance" "vm" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = var.instancetype[1]
    key_name = "terraformcloud"
  tags = {
    Name = var.name["dev"]
  }
}

