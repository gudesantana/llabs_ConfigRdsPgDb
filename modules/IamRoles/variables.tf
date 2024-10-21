variable "roles" {
  type        = map(map(list(string)))
}

variable "tags" {
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "aws_account_id" {
  type = string
}