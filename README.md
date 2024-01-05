# Terraform Tricks and patterns
```
D:\dc\terraform\demo1>terraform init

Initializing the backend...
Initializing modules...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v5.31.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

D:\dc\terraform\demo1>terraform plan
data.aws_iam_roles.roles: Reading...
module.policies["policy21"].aws_iam_policy.policy: Refreshing state... [id=arn:aws:iam::251xxxxxxx983:policy/policy21]
module.policies["policy22"].aws_iam_policy.policy: Refreshing state... [id=arn:aws:iam::251xxxxxxx983:policy/policy22]
module.policies["policy1"].aws_iam_policy.policy: Refreshing state... [id=arn:aws:iam::251xxxxxxx983:policy/policy1]
data.aws_iam_roles.roles: Read complete after 0s [id=us-east-1]
module.roles["role2"].data.aws_caller_identity.current: Reading...
module.roles["role1"].data.aws_caller_identity.current: Reading...
module.roles["role2"].data.aws_caller_identity.current: Read complete after 0s [id=251xxxxxxx983]
module.roles["role1"].data.aws_caller_identity.current: Read complete after 0s [id=251xxxxxxx983]
module.roles["role1"].aws_iam_role.role: Refreshing state... [id=role1]
module.roles["role2"].aws_iam_role.role: Refreshing state... [id=role2]
module.roles["role2"].aws_iam_role_policy_attachment.policyattach["policy22"]: Refreshing state... [id=role2-20240103182756337900000002]
module.roles["role2"].aws_iam_role_policy_attachment.policyattach["policy21"]: Refreshing state... [id=role2-20240103182756322700000001]
module.roles["role1"].aws_iam_role_policy_attachment.policyattach["policy1"]: Refreshing state... [id=role1-20240103182756353200000003]

Changes to Outputs:
  ~ roles           = {
      ~ role1 = {
          - account_id = "251xxxxxxx983"
          + role       = {
              + arn                   = "arn:aws:iam::251xxxxxxx983:role/role1"
              + assume_role_policy    = jsonencode(
                    {
                      + Statement = [
                          + {
                              + Action    = "sts:AssumeRole"
                              + Effect    = "Allow"
                              + Principal = {
                                  + AWS = "arn:aws:iam::251xxxxxxx983:root"
                                }
                            },
                        ]
                      + Version   = "2012-10-17"
                    }
                )
              + create_date           = "2024-01-03T18:27:55Z"
              + description           = "role1 description"
              + force_detach_policies = false
              + id                    = "role1"
              + inline_policy         = []
              + managed_policy_arns   = [
                  + "arn:aws:iam::251xxxxxxx983:policy/policy1",
                ]
              + max_session_duration  = 3600
              + name                  = "role1"
              + name_prefix           = ""
              + path                  = "/"
              + permissions_boundary  = ""
              + tags                  = {}
              + tags_all              = {}
              + unique_id             = "AROATVKRTQ7DUHFZIR6JE"
            }
        }
      ~ role2 = {
          - account_id = "251xxxxxxx983"
          + role       = {
              + arn                   = "arn:aws:iam::251xxxxxxx983:role/role2"
              + assume_role_policy    = jsonencode(
                    {
                      + Statement = [
                          + {
                              + Action    = "sts:AssumeRole"
                              + Effect    = "Allow"
                              + Principal = {
                                  + AWS = "arn:aws:iam::251xxxxxxx983:root"
                                }
                            },
                        ]
                      + Version   = "2012-10-17"
                    }
                )
              + create_date           = "2024-01-03T18:27:55Z"
              + description           = "role2 description"
              + force_detach_policies = false
              + id                    = "role2"
              + inline_policy         = []
              + managed_policy_arns   = [
                  + "arn:aws:iam::251xxxxxxx983:policy/policy21",
                  + "arn:aws:iam::251xxxxxxx983:policy/policy22",
                ]
              + max_session_duration  = 3600
              + name                  = "role2"
              + name_prefix           = ""
              + path                  = "/"
              + permissions_boundary  = ""
              + tags                  = {}
              + tags_all              = {}
              + unique_id             = "AROATVKRTQ7D4IFIZS2Z5"
            }
        }
    }

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

D:\dc\terraform\demo1>terraform apply
data.aws_iam_roles.roles: Reading...
module.policies["policy21"].aws_iam_policy.policy: Refreshing state... [id=arn:aws:iam::251xxxxxxx983:policy/policy21]
module.policies["policy1"].aws_iam_policy.policy: Refreshing state... [id=arn:aws:iam::251xxxxxxx983:policy/policy1]
module.policies["policy22"].aws_iam_policy.policy: Refreshing state... [id=arn:aws:iam::251xxxxxxx983:policy/policy22]
data.aws_iam_roles.roles: Read complete after 0s [id=us-east-1]
module.roles["role2"].data.aws_caller_identity.current: Reading...
module.roles["role1"].data.aws_caller_identity.current: Reading...
module.roles["role2"].data.aws_caller_identity.current: Read complete after 0s [id=251xxxxxxx983]
module.roles["role1"].data.aws_caller_identity.current: Read complete after 0s [id=251xxxxxxx983]
module.roles["role1"].aws_iam_role.role: Refreshing state... [id=role1]
module.roles["role2"].aws_iam_role.role: Refreshing state... [id=role2]
module.roles["role2"].aws_iam_role_policy_attachment.policyattach["policy21"]: Refreshing state... [id=role2-20240103182756322700000001]
module.roles["role2"].aws_iam_role_policy_attachment.policyattach["policy22"]: Refreshing state... [id=role2-20240103182756337900000002]
module.roles["role1"].aws_iam_role_policy_attachment.policyattach["policy1"]: Refreshing state... [id=role1-20240103182756353200000003]

Changes to Outputs:
  ~ roles           = {
      ~ role1 = {
          - account_id = "251xxxxxxx983"
          + role       = {
              + arn                   = "arn:aws:iam::251xxxxxxx983:role/role1"
              + assume_role_policy    = jsonencode(
                    {
                      + Statement = [
                          + {
                              + Action    = "sts:AssumeRole"
                              + Effect    = "Allow"
                              + Principal = {
                                  + AWS = "arn:aws:iam::251xxxxxxx983:root"
                                }
                            },
                        ]
                      + Version   = "2012-10-17"
                    }
                )
              + create_date           = "2024-01-03T18:27:55Z"
              + description           = "role1 description"
              + force_detach_policies = false
              + id                    = "role1"
              + inline_policy         = []
              + managed_policy_arns   = [
                  + "arn:aws:iam::251xxxxxxx983:policy/policy1",
                ]
              + max_session_duration  = 3600
              + name                  = "role1"
              + name_prefix           = ""
              + path                  = "/"
              + permissions_boundary  = ""
              + tags                  = {}
              + tags_all              = {}
              + unique_id             = "AROATVKRTQ7DUHFZIR6JE"
            }
        }
      ~ role2 = {
          - account_id = "251xxxxxxx983"
          + role       = {
              + arn                   = "arn:aws:iam::251xxxxxxx983:role/role2"
              + assume_role_policy    = jsonencode(
                    {
                      + Statement = [
                          + {
                              + Action    = "sts:AssumeRole"
                              + Effect    = "Allow"
                              + Principal = {
                                  + AWS = "arn:aws:iam::251xxxxxxx983:root"
                                }
                            },
                        ]
                      + Version   = "2012-10-17"
                    }
                )
              + create_date           = "2024-01-03T18:27:55Z"
              + description           = "role2 description"
              + force_detach_policies = false
              + id                    = "role2"
              + inline_policy         = []
              + managed_policy_arns   = [
                  + "arn:aws:iam::251xxxxxxx983:policy/policy21",
                  + "arn:aws:iam::251xxxxxxx983:policy/policy22",
                ]
              + max_session_duration  = 3600
              + name                  = "role2"
              + name_prefix           = ""
              + path                  = "/"
              + permissions_boundary  = ""
              + tags                  = {}
              + tags_all              = {}
              + unique_id             = "AROATVKRTQ7D4IFIZS2Z5"
            }
        }
    }

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes


Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

policies_list = [
  "policy1",
  "policy21",
  "policy22",
]
requested_roles = [
  "role1",
  "role2",
]
roles = {
  "role1" = {
    "role" = {
      "arn" = "arn:aws:iam::251xxxxxxx983:role/role1"
      "assume_role_policy" = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::251xxxxxxx983:root\"}}],\"Version\":\"2012-10-17\"}"
      "create_date" = "2024-01-03T18:27:55Z"
      "description" = "role1 description"
      "force_detach_policies" = false
      "id" = "role1"
      "inline_policy" = toset([])
      "managed_policy_arns" = toset([
        "arn:aws:iam::251xxxxxxx983:policy/policy1",
      ])
      "max_session_duration" = 3600
      "name" = "role1"
      "name_prefix" = ""
      "path" = "/"
      "permissions_boundary" = ""
      "tags" = tomap({})
      "tags_all" = tomap({})
      "unique_id" = "AROATVKRTQ7DUHFZIR6JE"
    }
  }
  "role2" = {
    "role" = {
      "arn" = "arn:aws:iam::251xxxxxxx983:role/role2"
      "assume_role_policy" = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::251xxxxxxx983:root\"}}],\"Version\":\"2012-10-17\"}"
      "create_date" = "2024-01-03T18:27:55Z"
      "description" = "role2 description"
      "force_detach_policies" = false
      "id" = "role2"
      "inline_policy" = toset([])
      "managed_policy_arns" = toset([
        "arn:aws:iam::251xxxxxxx983:policy/policy21",
        "arn:aws:iam::251xxxxxxx983:policy/policy22",
      ])
      "max_session_duration" = 3600
      "name" = "role2"
      "name_prefix" = ""
      "path" = "/"
      "permissions_boundary" = ""
      "tags" = tomap({})
      "tags_all" = tomap({})
      "unique_id" = "AROATVKRTQ7D4IFIZS2Z5"
    }
  }
}

```
