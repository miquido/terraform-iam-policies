<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | => 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | => 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| path | Path in which to create the policy. See IAM Identifiers for more information. | `string` | `"/policies/"` | no |
| strict\_mfa\_enabled | Whether to create Strict MFA policy | `bool` | `true` | no |
| strict\_mfa\_name | Name prefix of Strict MFA Policy | `string` | `"StrictMFA"` | no |

## Outputs

| Name | Description |
|------|-------------|
| strict\_mfa\_arn | The ARN assigned by AWS to this policy. |
| strict\_mfa\_id | The policy's ID. |
| strict\_mfa\_name | The name of the policy. |

<!-- markdownlint-restore -->
