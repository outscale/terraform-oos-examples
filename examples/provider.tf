terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.34.99"
    }
  }
}
# for ore details about aws provider see:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

provider "aws" {
  access_key = var.access_key
  region     = var.region
  secret_key = var.secret_key

  # disable checks related to aws
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = var.endpoint
  }
}
