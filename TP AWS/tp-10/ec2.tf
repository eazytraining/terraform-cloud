resource "aws_instance" "vm" {
  ami = "ami-0c7217cdde317cfec"
  instance_type = var.instancetype
  key_name = "terraformcloud"
  tags = {
    Name = var.name
  }
}