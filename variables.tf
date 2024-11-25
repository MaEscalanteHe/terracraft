variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Region to deploy the resources"
}

variable "s3_bucket_tfstate" {
  type        = string
  default     = "tfbackend-s3-bucket"
  description = "S3 bucket to store the tfstate file"
}

variable "dynamodb_table_tfstate" {
  type        = string
  default     = "tfbackend-dynamodb-table"
  description = "DynamoDB table to store the tfstate lock"

}

###
variable "environment" {
  type        = string
  default     = "development"
  description = "Environment to deploy the resources"
}

variable "tf_tag" {
  type        = string
  default     = "Terraform"
  description = "Tag to identify resources created by terraform"
}
