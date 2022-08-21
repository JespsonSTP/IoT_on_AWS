terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.7"
    }
  }
  backend "s3" {
    bucket = "RENAMEME!"
    key    = "calabs/production/us-west-2/rslab/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "IoT-app" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "IoT-app-subnet" {
  vpc_id     = aws_vpc.IoT-app.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "calabvm-subnet"
  }
}
