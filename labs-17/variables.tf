variable "instancetype" {
  type = string
  description = "set aws instance type"
  default = "t2.nano"
}

variable "aws_common_tag" {
  type = string
  description = "set aws tag"
  default = "ec2-eazytraining"
}