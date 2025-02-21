data "aws_vpc" "platform_engineering_vpc" {
  filter {
    name   = "tag:Name"
    values = ["*Platform Engineering*"]
  }
}

data "aws_caller_identity" "current" {}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["Private*"]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = ["Public*"]
  }
}

data "aws_iam_role" "ecs_task_execution_role" {
  name = "AWSServiceRoleForECS"
}

data "aws_security_group" "default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }
}