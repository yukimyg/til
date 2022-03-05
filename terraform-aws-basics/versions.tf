terraform {
  required_version = "1.1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }

  cloud {
    organization = "yukimiyagi"
    workspaces {
      name = "terraform_aws_basics"
    }
  }
}
