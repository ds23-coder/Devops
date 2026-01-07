terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 5.0"
   }
 }
}

provider "aws" {
 region = "us-east-1"
}

resource "aws_instance" "example" {
 ami           = "ami-0a3c3a20c09d6f377"
 instance_type = "t3.micro"

 tags = {
   Name = "devops-ec2"
 }
}
