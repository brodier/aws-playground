terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-3"
}

resource "aws_instance" "server1" {
  ami = "ami-0b198a85d03bfa122"
  instance_type = "t2.micro"

  tags = {
    Name = "AlphaMicro"
  }
}

