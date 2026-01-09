# ---------------------------------------------------------------------------------------------------------------------
# VPC MODULE
# A simplified VPC module for demonstration purposes.
# In a real environment, this would create actual AWS VPC resources.
# ---------------------------------------------------------------------------------------------------------------------

# For demonstration purposes, we use local values instead of creating real resources
locals {
  vpc_id = "vpc-${substr(md5(var.name), 0, 8)}"

  public_subnet_ids = [
    "subnet-${substr(md5("${var.name}-public-1"), 0, 8)}",
    "subnet-${substr(md5("${var.name}-public-2"), 0, 8)}",
  ]

  private_subnet_ids = [
    "subnet-${substr(md5("${var.name}-private-1"), 0, 8)}",
    "subnet-${substr(md5("${var.name}-private-2"), 0, 8)}",
  ]
}
