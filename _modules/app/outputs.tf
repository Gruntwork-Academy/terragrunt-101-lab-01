output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = local.asg_name
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = local.alb_dns_name
}

output "url" {
  description = "The URL of the application"
  value       = "http://${local.alb_dns_name}"
}

output "security_group_id" {
  description = "The security group ID"
  value       = local.security_group_id
}
