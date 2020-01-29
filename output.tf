output "strict_mfa_id" {
  value       = join("", aws_iam_policy.strict-mfa.*.id)
  description = "The policy's ID."
}

output "strict_mfa_arn" {
  value       = join("", aws_iam_policy.strict-mfa.*.arn)
  description = " The ARN assigned by AWS to this policy."
}

output "strict_mfa_name" {
  value       = join("", aws_iam_policy.strict-mfa.*.name)
  description = " The name of the policy."
}
