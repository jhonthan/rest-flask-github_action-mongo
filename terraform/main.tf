module "k8s" {
  source = "git@github.com:jhonthan/terraform-comunidadedevops.git"
	cidr_block = "10.34.0.0/16"
	project_name = "k8s-rest-api"
	region = "us-east-1"
	tags = {
        Department = "DevOps"
    }
}