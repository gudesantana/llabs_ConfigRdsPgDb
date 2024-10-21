output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.sg_rds.id
}

output "security_group_arn" {
  description = "The ID of the security group"
  value       = aws_security_group.sg_rds.arn
}
