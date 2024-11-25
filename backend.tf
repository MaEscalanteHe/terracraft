terraform {
  backend "s3" {
    bucket         = "tfbackend-s3-bucket"
    key            = "development.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tfbackend-dynamodb-table"
    encrypt        = true
  }
}
