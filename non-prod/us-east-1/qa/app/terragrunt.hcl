# Configure the version of the module to use in this environment.
terraform {
  source = "git::https://github.com/Gruntwork-Academy/terragrunt-101-modules.git//ec2-instance?ref=main"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "envcommon" {
  path   = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/ec2-instance.hcl"
  expose = true
}


# ---------------------------------------------------------------------------------------------------------------------
# DEPENDENCIES
# The EC2 instance depends on the VPC for networking and security group for firewall rules.
# This demonstrates how Terragrunt builds a DAG from dependency declarations.
# ---------------------------------------------------------------------------------------------------------------------
dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id            = "vpc-mock12345"
    public_subnet_ids = ["subnet-mock1", "subnet-mock2"]
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

dependency "security_group" {
  config_path = "../security-group"

  mock_outputs = {
    security_group_id = "sg-mock12345"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

# Pass the VPC and security group outputs to the ec2-instance module
inputs = {
  subnet_id          = dependency.vpc.outputs.public_subnet_ids[0]
  security_group_ids = [dependency.security_group.outputs.security_group_id]
}
