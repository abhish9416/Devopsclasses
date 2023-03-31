terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.60.0"
    }
  }
  backend "s3" {
    bucket = "abhish0916terraforraform"
    region = "us-west-2"
    key = "classes/terraform_remote_backendtf"
    dynamodb_table = "terraformlocking"
  }
}

provider "aws" {
    region = var.region
  # Configuration options
}