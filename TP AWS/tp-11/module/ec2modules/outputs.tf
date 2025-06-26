# output "myip" {
#   value = aws_eip.ip.public_ip
# }

output "vm-id" {
  value = aws_instance.vm.id
}

output "az" {
  value = aws_instance.vm.availability_zone
}