variable "instancetype" {
  type    = list(any)
  default = ["t2.micro", "t2.medium", "t2.large"]
}

variable "tag" {
  type = map(any)
  default = {
    dev     = "ec2-dev"
    staging = "ec2-staging"
    prod    = "ec2-prod"
  }
}