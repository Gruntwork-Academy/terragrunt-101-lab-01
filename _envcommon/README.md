# Environment Common Configurations

This directory contains the common configurations that are shared across all environments for each component.

## How it works

Each `.hcl` file in this directory defines:

1. **locals** - Common variables including the base source URL for the module
2. **inputs** - Default input values that are shared across all environments

These configurations are included in the environment-specific `terragrunt.hcl` files using the `include` block.

## Files

- `vpc.hcl` - Common configuration for VPC deployments
- `app.hcl` - Common configuration for application deployments

## Usage

In your environment's `terragrunt.hcl`:

```hcl
include "envcommon" {
  path   = "${dirname(find_in_parent_folders("root.hcl"))}/_envcommon/vpc.hcl"
  expose = true
}
```
