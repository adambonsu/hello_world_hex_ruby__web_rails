resource "aws_ecs_service" "this" {
    name = "HelloWorldHexRubyWebRails"
    depends_on = [ aws_iam_policy.this ]
}

resource "aws_iam_policy" "this" {
    name = "HelloWorldHexRubyWebRailsPolicy"
    policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "ecs:DescribeClusters"
                ],
                "Resource": "*"
            }
        ]
    }
    EOF
    description = "Policy for HelloWorldHexRubyWebRails"
    path = "/"
    lifecycle {
        create_before_destroy = true
    }
    tags = {
        "Name" = "HelloWorldHexRubyWebRails"
    }
    depends_on = []
    provider = aws.iam
    count = 1
    id = "HelloWorldHexRubyWebRails"
    name_prefix = null
    tags_all = null
    user = null
    version = null
    force_detach_policies = null
    managed_policy_arns = null
    policy_arn = null
    roles = null
    statements = null
    users = null
    data_access = null
    data_access_policy = null
    data_access_role = null
    data_access_roles = null
    data_access_user = null
    data_access_users = null
    data_access_policy_id = null
    data_access_role_id = null
    data_access_user_id = null
    data_access_policy_statement_id = null
    data_access_role_statement_id = null
    data_access_user_statement_id = null
    data_access_policy_statement = null

}