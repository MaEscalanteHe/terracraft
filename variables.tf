variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "s3_bucket_tfstate" {
  type    = string
  default = "tfbackend-s3-bucket"
}

variable "dynamodb_table_tfstate" {
  type    = string
  default = "tfbackend-dynamodb-table"
}

variable "environment" {
  type    = string
  default = "development"
}

variable "tf_tag" {
  type    = string
  default = "terraform"
}

