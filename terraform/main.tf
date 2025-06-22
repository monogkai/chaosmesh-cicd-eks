provider "aws" {
  region = "eu-north-1"
}

resource "aws_ecr_repository" "app" {
  name = "app"
}