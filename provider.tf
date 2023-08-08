# Define the required provider block for AWS.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"  # Use the HashiCorp AWS provider.
      version = "5.11.0"         # Use version 5.11.0 of the AWS provider.
    }
  }
}

# Configure the AWS provider with the desired region.
provider "aws" {
  region = "ap-south-1"  # Set the AWS region to ap-south-1 (Asia Pacific - Mumbai).
  # You can add more configuration options here if needed.
}
