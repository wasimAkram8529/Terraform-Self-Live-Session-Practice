

data "aws_caller_identity" "current_user" {
  
}

output "account_id" {
  value = data.aws_caller_identity.current_user.account_id
}

# resource "aws_iam_user" "iam-user" {
#   for_each = var.iam-users
#   name = "admin-user-${data.aws_caller_identity.current_user.account_id}"
# }

# output "iam_users" {
#   value = aws_iam_user.iam-user
# }