variable "aws_region" {
  description = "AWS Region to deploy resources"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "aws_tf_bucket" {
  description = "Terraform S3 Bucket Name"
  type        = string
}

variable "aws_tf_key" {
  description = "Terraform S3 Bucket Key"
  type        = string
}
