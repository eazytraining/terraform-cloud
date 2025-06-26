resource "aws_instance" "vm" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    key_name = "terraformcloud"
  tags = {
    Name = "vm-eazy"
  }
}