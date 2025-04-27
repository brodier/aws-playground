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

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
  owners = ["amazon"]

}

resource "aws_key_pair" "deployer" {
  key_name   = "admin-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgo8w8kMVG/j3LcH53xDv3lSOn8Qu+MqAKGFcwU+vn1df99XWoux+vT/BF0pjqBh/2+Drrs/WffQFTBBBelyndMssGEuUAtcXA+5APEgEQpyzMak6cB7AW0mEfBCD8PX0fj7xvCTVeekLeCo7BW9jEmUEHVkcP/2SUo+3PfMQAagvmX0kwfRlzhZCZLv10HVHQjtUKCShuL/ZJQxo1mwsltCT2KMRzd/f3rMJYkjGmOfkKFDIMXb2ATFe7cdH4frnrkrwfDdQpy5q3VEvkGhzBBVtF1NB00WQCghXwfFy2+JFWtSiZ76fo+zfmZCqEPUgugoWHC8fiYsNv4wIMzto6Q== ubuntu@aws.com"
}

resource "aws_instance" "srv1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "admin-key"
  tags = {
    Name = "AlphaMicro"
  }
}

