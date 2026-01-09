# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT STACK CONFIGURATION
# This stack bootstraps AWS infrastructure for GitHub Actions with OIDC authentication.
# It creates IAM OIDC provider and roles for Gruntwork Pipelines.
#
# Stack source: https://github.com/gruntwork-io/terragrunt-scale-catalog
# ---------------------------------------------------------------------------------------------------------------------

locals {
  # Load account-level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Extract account variables
  account_name = local.account_vars.locals.account_name
  account_id   = local.account_vars.locals.aws_account_id
}

# Reference the AWS GitHub Pipelines Bootstrap stack from the terragrunt-scale-catalog
stack "bootstrap" {
  source = "github.com/gruntwork-io/terragrunt-scale-catalog//stacks/aws/github/pipelines-bootstrap?ref=v1.5.0"
  path   = "bootstrap"
  # Stack values - customize these for your environment
  values = {
    # TODO: Replace with your GitHub org
    github_org_name = "my-github-org"

    state_bucket_name = "my-terraform-state-bucket"

    github_repo_name = "terragrunt-101-lab-01"

    oidc_resource_prefix = "pipelines"
    deploy_branch        = "main"
  }
}
