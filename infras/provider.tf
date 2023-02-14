terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "worktest112"
    key            = "network/terraform.tfstate2"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-2"
}
