variable "aws_region" {
  description = "AWS region"
}

variable "namespace" {
  description = "Unique name to use for DNS and resource naming"
}

variable "aws_instance_ami" {
  description = "Amazon Machine Image ID"
}

variable "aws_instance_type" {
  description = "EC2 instance type"
}

variable "ssh_key_name" {
  description = "AWS key pair name to install on the EC2 instance"
}

variable "vpc_id" {
  description = "ID of VPC to deploy into"
}

# Please include at least 2 subnets from your VPC.
variable "subnet_ids" {
  description = "Subnet IDs of subnets in VPC"
}

variable "security_group_id" {
  description = "ID of security group to attach to EC2 and PostgreSQL RDS instances"
}

variable "database_password" {
  description = "Password for PostgreSQL database"
}

variable "ssl_certificate_id" {
  description = "ARN of an SSL certificate uploaded to IAM or AWS Certificate Manager for use with PTFE ELB"
}

variable "owner" {
  description = "EC2 instance owner"
}

variable "ttl" {
  description = "EC2 instance TTL"
  default     = "168"
}

variable "route53_zone" {
  description = "name of Route53 zone to use"
  default = "hashidemos.io"
}
