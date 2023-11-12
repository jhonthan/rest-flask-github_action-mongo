#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository.html
resource "aws_ecr_repository" "this" {
  name                 = "restapi"
  force_delete         = true
}