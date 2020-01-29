## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| path | Path in which to create the policy. See IAM Identifiers for more information. | string | `/policies/` | no |
| strict_mfa_enabled | Whether to create Strict MFA policy | bool | `true` | no |
| strict_mfa_name | Name prefix of Strict MFA Policy | string | `StrictMFA` | no |

## Outputs

| Name | Description |
|------|-------------|
| strict_mfa_arn | The ARN assigned by AWS to this policy. |
| strict_mfa_id | The policy's ID. |
| strict_mfa_name | The name of the policy. |

