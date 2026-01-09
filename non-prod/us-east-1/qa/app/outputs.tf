# ---------------------------------------------------------------------------------------------------------------------
# CUSTOM OUTPUTS
# This file adds custom outputs specific to this unit deployment.
# Note: When Terragrunt runs, it copies these local .tf files into the cache alongside the module source.
# ---------------------------------------------------------------------------------------------------------------------

# BUG: This output references a local value that doesn't exist in the app module!
# The module defines local.asg_name, local.alb_dns_name, and local.security_group_id,
# but this tries to reference local.launch_template_id which doesn't exist.
#
# To fix this, you could either:
# 1. Remove this output entirely
# 2. Reference a local that actually exists (e.g., local.asg_name)
#
# This demonstrates how local .tf files can introduce bugs that are hard to track down
# because the error occurs after Terragrunt assembles everything in the cache.

output "app_launch_template" {
  description = "The launch template ID for the application"
  value       = local.launch_template_id
}

