variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "availability_zone" {
  type = string
}

variable "db_name" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "storage_type" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "rds_port" {
  type = number
}

variable "vpc_id" {
  type = string
}

variable "parameters" {
  type    = list(map(string))
  default = []
}

variable "vpc_subnet_private_1a" {
  type = string
}

variable "vpc_subnet_private_1c" {
  type = string
}

variable "vpc_subnet_public_1a" {
  type = string
}

variable "vpc_subnet_public_1c" {
  type = string
}

variable "maintenance_window" {
  type = string
}

variable "backup_window" {
  type = string
}

variable "backup_retention_period" {
  type = string
}

variable "apply_immediately" {
  type = bool
}

variable "skip_final_snapshot" {
  type = bool
}

variable "multi_az" {
  type = bool
}

variable "publicly_accessible" {
  type = bool
}

variable "deletion_protection" {
  type = bool
}

# variable "security_group_id" {
#     type = string
# }