terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 5.0"
   }
 }
}

provider "aws" {
 region = var.region
}

resource "aws_security_group" "web_sg" {
 name        = "devops-web-sg"
 description = "Allow HTTP and SSH"

 ingress {
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

 ingress {
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_instance" "devops" {
 ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
 instance_type = var.instance_type
 key_name      = var.key_name

 vpc_security_group_ids = [aws_security_group.web_sg.id]

 tags = {
   Name = "DevOps-EC2"
 }
}
