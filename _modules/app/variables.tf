# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the application"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the application will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs for the ASG"
  type        = list(string)
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Minimum number of instances in the ASG"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of instances in the ASG"
  type        = number
  default     = 4
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
