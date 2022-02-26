terraform {
  required_version = "1.1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}
