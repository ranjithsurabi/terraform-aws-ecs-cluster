terraform {
  backend "s3" {
    bucket         = "terraformstatefiles4"
    key            = "/ecs-cluster-module/${var.env}/${var.appname}.tfstate"
    region         = var.region
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}

resource "aws_s3_bucket" "this" {
  bucket        = "${var.bucket_name}.${data.aws_region.region.name}.${data.aws_ssm_parameter.domain.value}"
  force_destroy = var.force_destroy

  lifecycle {
    precondition {
      condition     = length("${var.bucket_name}.${data.aws_region.region.name}.${data.aws_ssm_parameter.domain.value}") > 3 && length("${var.bucket_name}.${data.aws_region.region.name}.${data.aws_ssm_parameter.domain.value}") < 63
      error_message = "The bucket name can be between 3 and 63 characters long, and can contain only lower-case characters, numbers, periods, and dashes. Each label in the bucket name must start with a lowercase letter or number."
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.encryption == "AES256" ? null : var.kms_master_key_id
      sse_algorithm     = var.encryption
    }
  }
  #   bucket_key_enabled = true
}