variable name {
	type = any
}
variable policies {
	type = any
}
variable description {
	type = any
}

locals {
	account_id = data.aws_caller_identity.current.account_id
	trust = jsonencode({
		"Version"= "2012-10-17",
		"Statement"= [
			{
				"Effect"= "Allow",
				"Principal"= {
					"AWS"= "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
				},
				"Action"= "sts:AssumeRole"
			}
		]
	})
}

data "aws_caller_identity" "current" {}

resource aws_iam_role role {  
  name        = var.name
  path        = "/"
  description = var.description  
  assume_role_policy = local.trust
}

resource aws_iam_role_policy_attachment policyattach {
  for_each = toset(var.policies)
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::${local.account_id}:policy/${each.key}"  
}

output "role" {
  value = aws_iam_role.role
}