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
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.19.0"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  ami                    = "ami-0ed094fb1304fd857"
  instance_type          = "t3.micro"
  key_name               = "terraform_Server"
  monitoring             = true
  vpc_security_group_ids = ["sg-0cca2ef92984e8053"]
  subnet_id              = "subnet-017ad3b7be4236d51"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
