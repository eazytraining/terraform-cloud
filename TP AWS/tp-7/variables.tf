variable "instancetype" {
  type = list(any)
  default = [ "t2.micro", "t2.medium", "t2.large" ]
}

variable "name" {
  type = map(any)
  default = {
    dev = "ec2-dev"
    prod = "ec2-prod"
    staging = "ec2-staging"
  }
}