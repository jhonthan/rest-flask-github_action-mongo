module "kubernetes" {
  source = "/home/jhon/DevOps/comunidade-devops-mateus-muller/terraform-comunidadedevops"
	cidr_block = "10.34.0.0/16"
	project_name = "restapi"
	region = "us-east-1"
	tags = {
        Department = "DevOps"
    }
}