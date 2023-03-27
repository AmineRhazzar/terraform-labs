terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "default"
  region  = "eu-north-1"
}

# creating a bucket encryption key for sse
resource "aws_kms_key" "bucket_encryption_key" {
  description             = "This key is used to encrypt/decrypt bucket objects"
  deletion_window_in_days = 30 
}

# creating the bucket
resource "aws_s3_bucket" "my-first-bucket" {
  bucket = "mrhazzar-tf-bucket-1"

  tags = {
    Name        = "my-first-bucket"
    Environment = "production"
  }
}

# enable SSE on the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "my-first-bucket-sse" {
  bucket = aws_s3_bucket.my-first-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.bucket_encryption_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# enable versioning on the bucket
resource "aws_s3_bucket_versioning" "my-first-bucket-versioning" {
  bucket = aws_s3_bucket.my-first-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


# creating s3 objects lifecycle policy to transition them to Glacier after 30days
resource "aws_s3_bucket_lifecycle_configuration" "my-first-bucket-objects-lifecycle-policy" {
  bucket = aws_s3_bucket.my-first-bucket.id

  rule {
    id = "Glacier-transition-after-30-days"

    
    transition {
      days = 30
      storage_class = "GLACIER"
    }

    status = "Enabled"
  }
}
