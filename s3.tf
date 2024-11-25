resource "aws_s3_bucket" "s3_bucket_tfbackend" {
  bucket = var.s3_bucket_tfstate

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_tfbackend_acl_ownership_controls" {
  bucket = aws_s3_bucket.s3_bucket_tfbackend.id

  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_tfbackend_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_tfbackend_acl_ownership_controls]

  bucket = aws_s3_bucket.s3_bucket_tfbackend.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3_bucket_tfbackend_versioning" {
  bucket = aws_s3_bucket.s3_bucket_tfbackend.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_tfbackend_sse" {
  bucket = aws_s3_bucket.s3_bucket_tfbackend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_tfbackend_public_access" {
  bucket                  = aws_s3_bucket.s3_bucket_tfbackend.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "terraform_folder" {
  bucket = aws_s3_bucket.s3_bucket_tfbackend.id

  key = "${var.environment}.tfstate"
}
