# ---------------------------------------------------------------------------------------------------------------------
# APP MODULE
# A simplified application module for demonstration purposes.
# In a real environment, this would create an Auto Scaling Group with an ALB.
# ---------------------------------------------------------------------------------------------------------------------

# For demonstration purposes, we use local values instead of creating real resources
locals {
  asg_name          = "asg-${substr(md5(var.name), 0, 8)}"
  alb_dns_name      = "${var.name}-alb-${substr(md5(var.name), 0, 8)}.${var.aws_region != "" ? var.aws_region : "us-east-1"}.elb.amazonaws.com"
  security_group_id = "sg-${substr(md5(var.name), 0, 8)}"
}
