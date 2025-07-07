resource "aws_ecr_repository" "app" {
  name = "app"
  tags = {
    Environment = "ci-cd"
  }
}