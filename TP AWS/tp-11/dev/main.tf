module "ec2module" {
  source       = "../module/ec2module"
  name         = "ec2-dev-ulrich"
  instancetype = "t2.nano"

}

resource "aws_eip" "ip" {
  instance = module.ec2module.vm-id 
  domain = "vpc"
# approche linux
#   provisioner "local-exec" {
#     command ="echo PUBLIC IP: ${aws_eip.ip.public_ip} ; ID: ${aws_instance.vm.id} ; AZ: ${aws_instance.vm.availability_zone}; >> infos_ec2.txt"

#   }
# Approche Windows sur powershell
provisioner "local-exec" {
    command = "Write-Output 'PUBLIC IP: ${aws_eip.ip.public_ip} ; ID: ${module.ec2module.vm-id} ; AZ: ${module.ec2module.az}' >> infos_ec2_dev.txt"
    interpreter = [ "Powershell", "-command" ]
  } 
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2module.vm-id
  allocation_id = aws_eip.ip.id
}