terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.9.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# provider "helm" {
#   kubernetes {
#     host                   = module.kubernetes.endpoint
#     cluster_ca_certificate = base64decode(module.kubernetes.certificate_authority)
#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       args        = ["eks", "get-token", "--cluster-name", module.kubernetes.cluster_name]
#       command     = "aws"
#     }
#   }
# }