#  terraform import aws_instance.console i-0a540f40b0b1f756e
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "console" {
  ami = "ami-0e9a573478feb50d0"
  instance_type = "t3.micro"
}
