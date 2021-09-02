# Input variable definitions

variable "aws_region" {
  description = "AWS region for all resources."

  type    = string
  default = "us-east-1"
}

variable "AWS_SECRET_KEY" {
  type    = string
  default = ""
}

variable "AWS_ACCESS_KEY" {
  type    = string
  default = ""
}

variable "master_username" {
  type    = string
  default = ""
}

variable "master_password" {
  type    = string
  default = ""
}
