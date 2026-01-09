# Set common variables for the global region. Global resources (like IAM) are not region-specific,
# but we still need a region for the AWS provider.
locals {
  aws_region = "us-east-1"
}
