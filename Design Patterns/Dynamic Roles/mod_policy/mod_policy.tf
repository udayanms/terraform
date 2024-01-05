
variable name {
	type = any
}

variable policyjson {
	type = any
}

variable description {
	type = any
}

#data template_file json {
#  template = "${file("${var.policyjson}")}"
#}

resource  aws_iam_policy policy {  
  name        = var.name
  path        = "/"
  description = var.description
  
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file(var.policyjson) #data.template_file.json
}

output policy {
	value = aws_iam_policy.policy
}