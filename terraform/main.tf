provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
  
}
module "vpc" {
  source = "/modules/vpc"
}

module "ecs" {
  source = "/modules/ecs"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  container_image = var.container_image
}

output "vpc_id" {
    description = "ID of the created VPC"
    value = module.vpc.vpc_id
}

output "public_subnet_ids" {
    description = "IDs of the public subnets"
    value = module.vpc.public_subnet_ids
}

output "alb_dns_name" {
    description = "DNS name of the ALB"
    value = module.ecs.alb_dns_name
}