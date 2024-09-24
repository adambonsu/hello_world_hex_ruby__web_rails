resource "aws_security_group" "this" {
    vpc_id = var.vpc_id

    ingress {
        from_port = var.aws_security_group_port
        to_port = var.aws_security_group_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_ecs_cluster" "this" {
    name = var.aws_ecs_cluster_name
}

resource "aws_ecs_task_definition" "this" {
    family = var.aws_ecs_task_definition_family
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    cpu                      = 1024
    memory                   = var.aws_ecs_task_definition_memory
    container_definitions = jsonencode([
        {
            name = var.aws_ecs_task_definition_container_name
            image = var.container_image
            cpu = 1024
            essential = true
            memory = var.aws_ecs_task_definition_memory
            portMappings = [
                {
                    containerPort = var.aws_security_group_port
                    hostPort = var.aws_security_group_port
                }
            ]
        }
    ])

    execution_role_arn = var.execution_role_arn
}

# resource "aws_lb" "this" {
#     name = var.aws_lb_name
#     internal = false
#     load_balancer_type = "network"
#     subnets = var.public_subnet_ids
#     security_groups = [aws_security_group.this.id]
# }

# resource "aws_lb_target_group" "this" {
#     name = var.aws_lb_target_group_name
#     port = var.aws_security_group_port
#     protocol = "TCP"
#     vpc_id = var.vpc_id

#     health_check {
#         healthy_threshold = "2"
#         protocol = "HTTP"
#         interval = "30"
#         matcher = "200-299"
#         timeout = "5"
#         path = "/"
#         unhealthy_threshold = "2"
#     }
  
# }

# resource "aws_lb_listener" "http" {
#     load_balancer_arn = aws_lb.this.arn
#     port = "80"
#     protocol = "TCP"

#     default_action {
#         type = "forward"
#         target_group_arn = aws_lb_target_group.this.arn
#     }
# }

resource "aws_ecs_service" "this" {
    name = var.aws_ecs_service_name
    cluster = aws_ecs_cluster.this.id
    task_definition = aws_ecs_task_definition.this.arn
    desired_count = var.aws_ecs_service_desired_count
    launch_type = var.aws_ecs_service_lauch_type

    network_configuration {
        security_groups = [aws_security_group.this.id]
        subnets = var.public_subnet_ids
        assign_public_ip = var.aws_ecs_service_network_configuration_assign_public_ip
    }

    # load_balancer {
    #     target_group_arn = aws_lb_target_group.this.arn
    #     container_name = var.aws_ecs_task_definition_container_name
    #     container_port = var.aws_security_group_port
    # }
    # depends_on = [ aws_iam_policy.this ]
}

