# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform and OpenTofu that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

# Include the root `terragrunt.hcl` configuration. The root configuration contains settings that are common across all
# components and environments, such as how to configure remote state.
include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Include the envcommon configuration for the component. The envcommon configuration contains settings that are common
# for the component across all environments.
include "envcommon" {
  path   = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/security-group.hcl"
  expose = true
}

# Configure the version of the module to use in this environment.
terraform {
  source = "git::https://github.com/Gruntwork-Academy/terragrunt-101-modules.git//security-group?ref=main"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPENDENCIES
# The security group depends on the VPC for the vpc_id.
# ---------------------------------------------------------------------------------------------------------------------
dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id = "vpc-mock12345"
  }
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
}

# Pass the VPC outputs to the security-group module
inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
}
