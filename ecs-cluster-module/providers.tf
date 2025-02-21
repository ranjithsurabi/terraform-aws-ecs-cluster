terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version : "~> 5.0"
    }
  }
  required_version = "~> 1.5.6"
}

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