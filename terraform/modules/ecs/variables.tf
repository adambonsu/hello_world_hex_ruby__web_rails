variable "vpc_id" {
    description = "VPC ID"
    type        = string
}

variable "aws_security_group_port" {
    description = "port number"
    type        = number
    default     = 3000
}

variable "aws_ecs_cluster_name" {
    description = "Cluster Name"
    type        = string
    default =   "HelloWorldHexRubyWebRailsCluster20240924"
}

variable "aws_ecs_task_definition_family" {
    description = "Task Definition Family"
    type        = string
    default     = "HelloWorldHexRubyWebRails"
}

variable "aws_ecs_task_definition_container_name" {
    description = "Container Name"
    type        = string
    default     = "HelloWorldHexRubyWebRailsCN"
}

variable "container_image" {
    description = "Container Image"
    type        = string
    default     = "757721680185.dkr.ecr.eu-west-2.amazonaws.com/hello-world-hex-ruby-web-rails:v2"
}

variable "execution_role_arn" {
    description = "Execution Role ARN"
    type        = string
    default     = "arn:aws:iam::757721680185:role/ecsTaskExecutionRole"
}

variable "aws_lb_name" {
    description = "Load Balancer Name"
    type        = string
    default     = "HelloWorldHexRubyWebRailsLB"
}
  
variable "public_subnet_ids" {
    description = "CIDR blocks for the public subnets"
    type        = list(string)
}

variable "aws_lb_target_group_name" {
    description = "Target Group Name"
    type        = string
    default     = "HelloWorldHexRubyWebRailsTG"
}

variable "aws_ecs_service_name" {
    description = "Service Name"
    type        = string
    default     = "HelloWorldHexRubyWebRailsService"
}

variable "aws_ecs_service_desired_count" {
    description = "Desired Count"
    type        = number
    default     = 3
}

variable "aws_ecs_service_lauch_type" { 
    description = "Launch Type"
    type        = string
    default     = "FARGATE"
}

variable "aws_ecs_service_network_configuration_assign_public_ip" {
    description = "Assign Public IP"
    type        = bool
    default     = true
}

variable "aws_ecs_service_load_balancer_container_name" { 
    description = "Container Name"
    type        = string
    default     = "HelloWorldHexRubyWebRailsContainerName"
}

variable "aws_ecs_task_definition_memory" { 
    description = "Memory"
    type        = number
    default     = 2048
}