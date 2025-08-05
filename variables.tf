variable "aws_instance_type" {
    default = "t2.micro"
    type = string
}

variable "aws_root_storage" {
    default = 10
    type = number
}

variable "aws_security_group" {
  default  = "my_sec_grp"
  type = string
}

variable "env" {
  default = "prd"
  type = string
}
