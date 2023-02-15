terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
    backend "s3" {
    bucket = "worktest112"
    key    = "network/terraform.tfstate"
    region = "us-east-2"
 }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "samskey" {
  key_name   = "my-key-pair"
  public_key = var.aws_key_pair
}
