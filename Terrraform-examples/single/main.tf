terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  # access_key = "xxxxxxxxxxxxxxxxxxxx"
  # secret_key = "xxxxxxxxxxxxxxxxxx"
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.19.0"

  name = "single-instance"

  ami                    = "ami-0ed094fb1304fd857"
  instance_type          = "t2.micro"
  key_name               = "Terraform_key"
  monitoring             = true
  #subnet_id = "subnet-082574a5d56740791"
  
  tags = {
    Name = "terraform-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}
