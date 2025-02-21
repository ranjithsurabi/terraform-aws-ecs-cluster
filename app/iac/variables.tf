variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "test"
}

variable "container_insights" {
  description = "Enable container insights for ECS"
  type        = bool
  default     = false
}

variable "capacity_providers" {
  description = "List of capacity providers for the ECS cluster"
  type        = list(string)
  default     = ["FARGATE"]
}

variable "default_capacity_provider_strategy" {
  description = "Default capacity provider strategy for the cluster"
  type = list(object({
    capacity_provider = string
    weight            = number
    base              = optional(number, 0)
  }))
  default = []
}
variable "appname" {
  default     = "app"
  description = "Name of the Application"
}
variable "env" {
  default     = "dev"
  description = "Environment for deployment"
}
variable "domain" {
  default     = "PE"
  description = "Domain Name"
}
variable "teamname" {
  default     = "PE"
  description = "Team Name"
}
variable "region" {
  default     = "us-east-2"
  description = "Team Name"
}
## Task Definition 
variable "task_family" {
  description = "Task family name"
  type        = string
}

variable "execution_role_arn" {
  description = "IAM role for ECS execution"
  type        = string
}

variable "cpu" {
  description = "CPU units for the task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memory for the task"
  type        = string
  default     = "512"
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_image" {
  description = "Docker image URL"
  type        = string
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
}

variable "environment_variables" {
  description = "List of environment variables"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}