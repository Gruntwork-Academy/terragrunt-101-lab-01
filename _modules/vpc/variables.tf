# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the VPC"
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "The environment name"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = ""
}

variable "account_name" {
  description = "The AWS account name"
  type        = string
  default     = ""
}

variable "aws_account_id" {
  description = "The AWS account ID"
  type        = string
  default     = ""
}
