terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_use_path_style           = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

variable "log_bucket_name" {
  description = "Globally unique name for the OT monitoring log bucket"
  type        = string
}

resource "aws_s3_bucket" "ot_monitor_logs" {
  bucket        = var.log_bucket_name
  force_destroy = false

  tags = {
    Project     = "OT-Security-Monitor"
    Environment = "Monitoring"
    Purpose     = "Centralised-OT-Logs"
  }
}

resource "aws_s3_bucket_public_access_block" "ot_monitor_logs" {
  bucket = aws_s3_bucket.ot_monitor_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ot_monitor_logs" {
  bucket = aws_s3_bucket.ot_monitor_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "ot_monitor_logs" {
  bucket = aws_s3_bucket.ot_monitor_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "ot_monitor_logs" {
  bucket = aws_s3_bucket.ot_monitor_logs.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
