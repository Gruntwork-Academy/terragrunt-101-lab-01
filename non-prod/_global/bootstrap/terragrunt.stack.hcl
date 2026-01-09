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
stack {
  source = "github.com/gruntwork-io/terragrunt-scale-catalog//stacks/aws/github/pipelines-bootstrap?ref=v1.5.0"

  # Stack values - customize these for your environment
  values = {
    # Required: S3 bucket for OpenTofu/Terraform state
    # TODO: Replace with your actual state bucket name
    state_bucket_name = "my-terraform-state-bucket"

    # Required: GitHub organization or username
    # TODO: Replace with your GitHub org/username
    github_org_name = "my-github-org"

    # Required: GitHub repository name
    # TODO: Replace with your repository name
    github_repo_name = "infrastructure-live"

    # Optional: Prefix for IAM resources (default: "pipelines")
    oidc_resource_prefix = "pipelines"

    # Optional: Branch allowed to run apply operations (default: "main")
    deploy_branch = "main"
  }
}
