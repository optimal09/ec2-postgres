terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = var.backup_bucket_name
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-2"
}
