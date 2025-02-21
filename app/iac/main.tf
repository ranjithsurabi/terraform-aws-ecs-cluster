terraform {
  backend "s3" {
    bucket         = "terraformstatefiles4"
    key            = "ecs-cluster-module/env/appname.tfstate" #this will not be hardcode just for test
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}

module "ecs_cluster" {
  source                             = "../../ecs-cluster-module"
  cluster_name                       = var.cluster_name
  container_insights                 = var.container_insights
  capacity_providers                 = var.capacity_providers
  default_capacity_provider_strategy = var.default_capacity_provider_strategy

  # Task Definition Parameters
  task_family     = "cat-gif-task"
  cpu             = "256"
  memory          = "512"
  container_name  = "cat-gif-container"
  container_image = "ranjithsurabi.jfrog.io/artifactory/docker-images/cat-gif:latest"
  container_port  = 5000
  environment_variables = [
    { name = "PORT", value = "5000" }
  ]
}