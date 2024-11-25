provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Provider    = var.tf_tag
    }
  }
}
