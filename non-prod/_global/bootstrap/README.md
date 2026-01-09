# AWS GitHub Pipelines Bootstrap

This stack bootstraps AWS infrastructure for GitHub Actions with OIDC authentication. It creates all necessary AWS resources to enable secure, keyless authentication from GitHub Actions workflows to your AWS account for [Gruntwork Pipelines](https://www.gruntwork.io/platform/pipelines).

## What This Stack Creates

- **IAM OIDC Provider** - For GitHub Actions authentication
- **Plan Role** - IAM role for running Terragrunt plans (read-only, any branch)
- **Apply Role** - IAM role for running Terragrunt applies (read-write, main branch only)
- **IAM Policies** - For S3 state bucket access

## Prerequisites

Before deploying this stack, ensure you have:

1. An S3 bucket for Terraform/OpenTofu state
2. A GitHub repository where you'll run Pipelines
3. Terragrunt installed (with stacks support)

## Configuration

Edit `terragrunt.stack.hcl` and update the following values:

| Value | Description | Required |
|-------|-------------|----------|
| `state_bucket_name` | S3 bucket for OpenTofu state | Yes |
| `github_org_name` | GitHub organization or username | Yes |
| `github_repo_name` | GitHub repository name | Yes |
| `oidc_resource_prefix` | Prefix for IAM resources | No (default: `pipelines`) |
| `deploy_branch` | Branch allowed to apply | No (default: `main`) |

## Usage

```bash
# Navigate to the bootstrap directory
cd non-prod/_global/bootstrap

# Initialize and generate the stack
terragrunt stack init

# Run a plan to see what will be created
terragrunt run-all plan

# Apply the stack
terragrunt run-all apply
```

## Stack Source

This stack is sourced from the [Gruntwork Terragrunt Scale Catalog](https://github.com/gruntwork-io/terragrunt-scale-catalog).

See the [stack documentation](https://github.com/gruntwork-io/terragrunt-scale-catalog/tree/main/stacks/aws/github/pipelines-bootstrap) for more details on available configuration options.
