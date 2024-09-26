terraform {
  backend "s3" {
    bucket = "hello-world-hex-ruby-web-rails.remote-backend"
    key = "terraform/dev/terraform.tfstate"
    region = "eu-west-2"
  }
}
module "vpc" {
    source = "../../modules/vpc"
    availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
    environment = "dev"
    private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
    public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    vpc_cidr = "10.0.0.0/16"
}

module "ecs" {
    source = "../../modules/ecs"
    aws_ecs_cluster_name = "HelloWorldHexRubyWebRailsCluster20240925"
    aws_ecs_service_desired_count = 1
    aws_ecs_service_name = "HelloWorldHexRubyWebRailsService"
    aws_ecs_service_lauch_type = "FARGATE"
    aws_ecs_service_load_balancer_container_name = "HelloWorldHexRubyWebRailsContainerName"
    aws_ecs_service_network_configuration_assign_public_ip = true
    aws_ecs_task_definition_container_name = "HelloWorldHexRubyWebRailsCN"
    aws_ecs_task_definition_cpu = 1024
    aws_ecs_task_definition_family = "HelloWorldHexRubyWebRails"
    aws_ecs_task_definition_memory = 2048
    aws_lb_name = "HelloWorldHexRubyWebRailsLB"
    aws_lb_target_group_name = "HelloWorldHexRubyWebRailsTG"
    aws_security_group_port = 3000
    container_image = "757721680185.dkr.ecr.eu-west-2.amazonaws.com/hello-world-hex-ruby-web-rails:v4"
    execution_role_arn = "arn:aws:iam::757721680185:role/ecsTaskExecutionRole"
    public_subnet_ids = module.vpc.public_subnet_ids
    vpc_id = module.vpc.vpc_id
}

output "vpc_id" {
  description = "ID of the created VPC"
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets"
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the created private subnets"
  value = module.vpc.private_subnet_ids
}

output "aws_ecs_cluster_arn" {
    value = module.ecs.aws_ecs_cluster_arn
}

output "alb_dns_name" {
    value = module.ecs.alb_dns_name
}