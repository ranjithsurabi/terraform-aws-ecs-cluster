terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version : "~> 5.0"
    }
  }
  required_version = "~> 1.6"
}

# terraform {
#   backend "s3" {
#     region = var.region
#     encrypt = true
#     dynamodb_table = "terraform-state-lock"
#   }
# }

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      "org:domain"   = var.domain
      "org:appname"  = var.appname
      "org:env"      = var.env
      "org:teamname" = var.teamname
    }
  }
}