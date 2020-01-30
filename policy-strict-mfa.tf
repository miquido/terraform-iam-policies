data "aws_caller_identity" "current" {}

# See: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_examples_aws_my-sec-creds-self-manage.html
data "aws_iam_policy_document" "strict-mfa" {
  version = "2012-10-17"

  statement {
    sid    = "AllowViewAccountInfo"
    effect = "Allow"
    actions = [
      "iam:ListUsers",
      "iam:GetAccountPasswordPolicy",
      "iam:GetAccountSummary",
      "iam:ListVirtualMFADevices",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "AllowManageOwnPasswords"
    effect = "Allow"
    actions = [
      "iam:ChangePassword",
      "iam:GetUser",
      "iam:CreateLoginProfile",
      "iam:DeleteLoginProfile",
      "iam:GetLoginProfile",
      "iam:UpdateLoginProfile",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}"]
  }

  statement {
    sid    = "AllowManageOwnAccessKeys"
    effect = "Allow"
    actions = [
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}"]
  }

  statement {
    sid    = "AllowManageOwnSigningCertificates"
    effect = "Allow"
    actions = [
      "iam:DeleteSigningCertificate",
      "iam:ListSigningCertificates",
      "iam:UpdateSigningCertificate",
      "iam:UploadSigningCertificate",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}"]
  }

  statement {
    sid    = "AllowManageOwnSSHPublicKeys"
    effect = "Allow"
    actions = [
      "iam:DeleteSSHPublicKey",
      "iam:GetSSHPublicKey",
      "iam:ListSSHPublicKeys",
      "iam:UpdateSSHPublicKey",
      "iam:UploadSSHPublicKey",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}"]
  }

  statement {
    sid    = "AllowManageOwnGitCredentials"
    effect = "Allow"
    actions = [
      "iam:CreateServiceSpecificCredential",
      "iam:DeleteServiceSpecificCredential",
      "iam:ListServiceSpecificCredentials",
      "iam:ResetServiceSpecificCredential",
      "iam:UpdateServiceSpecificCredential",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}"]
  }

  statement {
    sid    = "AllowManageOwnVirtualMFADevice"
    effect = "Allow"
    actions = [
      "iam:CreateVirtualMFADevice",
      "iam:DeleteVirtualMFADevice",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:mfa/$${aws:username}"]
  }

  statement {
    sid    = "AllowManageOwnUserMFA"
    effect = "Allow"
    actions = [
      "iam:DeactivateMFADevice",
      "iam:EnableMFADevice",
      "iam:ListMFADevices",
      "iam:ResyncMFADevice",
    ]
    resources = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}"]
  }

  statement {
    sid    = "DenyAllExceptListedIfNoMFA"
    effect = "Deny"
    not_actions = [
      "iam:ChangePassword",
      "iam:DeleteVirtualMFADevice",
      "iam:CreateLoginProfile",
      "iam:ListUsers",
      "iam:CreateVirtualMFADevice",
      "iam:EnableMFADevice",
      "iam:GetUser",
      "iam:ListMFADevices",
      "iam:ListVirtualMFADevices",
      "iam:ResyncMFADevice",
      "sts:GetSessionToken",
    ]

    resources = ["*"]

    condition {
      test     = "BoolIfExists"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["false"]
    }
  }
}

resource "aws_iam_policy" "strict-mfa" {
  count       = var.strict_mfa_enabled ? 1 : 0
  name_prefix = var.strict_mfa_name
  path        = var.path
  description = "Strict MFA policy to enforce MFA usage by AWS IAM users. Managed by IAM Policies Miquido's terraform module."
  policy      = data.aws_iam_policy_document.strict-mfa.json
}
