module "ecs_cluster" {
  source                             = "../../ecs-cluster-module"
  cluster_name                       = var.cluster_name
  container_insights                 = var.container_insights
  capacity_providers                 = var.capacity_providers
  default_capacity_provider_strategy = var.default_capacity_provider_strategy

  # Task Definition Parameters
  task_family           = var.task_family
  execution_role_arn    = data.aws_iam_role.ecs_execution_role.arn
  cpu                   = var.cpu
  memory                = var.memory
  container_name        = var.container_name
  container_image       = var.container_image
  container_port        = var.container_port
  environment_variables = var.environment_variables
}