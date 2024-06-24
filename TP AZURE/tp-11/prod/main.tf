module "ec2" {
  source = "../modules/ec2modules"
  instance_template =  "Standard_D2_v2"
  ssh_server_port =  "22"
  web_server_port = "80"
  tags = "ec2-dev"
}


