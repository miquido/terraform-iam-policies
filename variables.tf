variable "path" {
  type        = string
  default     = "/policies/"
  description = "Path in which to create the policy. See IAM Identifiers for more information."
}

variable "strict_mfa_enabled" {
  type        = bool
  default     = true
  description = "Whether to create Strict MFA policy"
}

variable "strict_mfa_name" {
  type        = string
  default     = "StrictMFA"
  description = "Name prefix of Strict MFA Policy"
}
