terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

data "aws_iam_roles" "roles" {}

locals {

	role_list = ["role1","role2" ]
	#role_list = []
	
	roles_def = {
		role1 = { description = "role1 description", policies = ["policy1"] },
		role2 = { description = "role2 description", policies = ["policy21","policy22"] }
	}
	policies = {
		policy1   = { description = "Policy 1 description",  policyjson = "policy1.json"},
		policy21  = { description = "Policy 21 description", policyjson = "policy21.json"},
		policy22  = { description = "Policy 22 description", policyjson = "policy22.json"}
	}
	
	policies_list = flatten ( [ for role in local.role_list : local.roles_def[role].policies ]  )
	
}

module policies {
	for_each 	= toset(local.policies_list)
	source 		= "./mod_policy"
	name 		= each.key
	description = local.policies[each.key].description
	policyjson 	= "${path.module}/policies/${local.policies[each.key].policyjson}"
}

module roles {
	for_each 	= toset(local.role_list)
	source 		= "./mod_role"
	name 		= each.key
	description = local.roles_def[each.key].description
	policies 	= flatten(local.roles_def[each.key].policies)
	depends_on  = [ module.policies ]
}

output roles {
	value = module.roles
}

output requested_roles {
	value = local.role_list
}

output policies_list {
	value = local.policies_list
}


