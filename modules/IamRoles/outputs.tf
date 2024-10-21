output "roles" {
  value = {
    for role in aws_iam_role.roles :
    role.name => {
      name = role.name
      arn  = role.arn
    }
  }
  description = "criacao de roles no formato `{ name = { name, arn }}`"
}