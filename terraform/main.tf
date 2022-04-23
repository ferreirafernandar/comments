terraform {
    required_version = ">=1.1.8"
    required_providers {
      aws = ">=4.10.0"
      local = ">=2.2.2"
    }
    backend "s3" {
      bucket = "comments-state-bucket"
      key    = "terraform.tfstate"
      region = "us-east-1"
    }
}

provider "aws" {
  region = "${var.region}"
}