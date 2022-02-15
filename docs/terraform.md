<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.strict-mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.strict-mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_path"></a> [path](#input\_path) | Path in which to create the policy. See IAM Identifiers for more information. | `string` | `"/policies/"` | no |
| <a name="input_strict_mfa_enabled"></a> [strict\_mfa\_enabled](#input\_strict\_mfa\_enabled) | Whether to create Strict MFA policy | `bool` | `true` | no |
| <a name="input_strict_mfa_name"></a> [strict\_mfa\_name](#input\_strict\_mfa\_name) | Name prefix of Strict MFA Policy | `string` | `"StrictMFA"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_strict_mfa_arn"></a> [strict\_mfa\_arn](#output\_strict\_mfa\_arn) | The ARN assigned by AWS to this policy. |
| <a name="output_strict_mfa_id"></a> [strict\_mfa\_id](#output\_strict\_mfa\_id) | The policy's ID. |
| <a name="output_strict_mfa_name"></a> [strict\_mfa\_name](#output\_strict\_mfa\_name) | The name of the policy. |
<!-- markdownlint-restore -->
