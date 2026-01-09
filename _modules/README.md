# Local Modules

This directory contains simplified Terraform modules for demonstration purposes in this lab exercise.

## Important Note

These modules do **not** create actual AWS resources. They generate mock output values that simulate what real infrastructure would produce. This allows you to explore Terragrunt concepts without incurring AWS costs or requiring AWS credentials.

## Modules

### vpc

Creates a mock VPC with public and private subnets.

**Inputs:**
- `name` - The name of the VPC
- `cidr_block` - The CIDR block for the VPC

**Outputs:**
- `vpc_id` - Mock VPC ID
- `vpc_cidr_block` - The CIDR block
- `public_subnet_ids` - Mock public subnet IDs
- `private_subnet_ids` - Mock private subnet IDs

### app

Creates a mock application deployment with ASG and ALB.

**Inputs:**
- `name` - The name of the application
- `instance_type` - EC2 instance type
- `min_size` / `max_size` - ASG size limits
- `vpc_id` - VPC ID for deployment
- `subnet_ids` - Subnet IDs for the ASG

**Outputs:**
- `asg_name` - Mock ASG name
- `alb_dns_name` - Mock ALB DNS name
- `url` - Mock application URL
- `security_group_id` - Mock security group ID
