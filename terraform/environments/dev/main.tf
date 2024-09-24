module "vpc" {
    source = "../../modules/vpc"

    vpc_cidr = "10.0.0.0/16"
    environment = "dev"
    public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
    availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

module "ecs" {
    source = "../../modules/ecs"
    vpc_id = module.vpc.vpc_id
    public_subnet_ids = module.vpc.public_subnet_ids
    execution_role_arn = "arn:aws:iam::757721680185:role/ecsTaskExecutionRole"
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