terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.91.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = "us-east-1"
}

resource "aws_instance" "web" {
  ami             = "ami-08b5b3a93ed654d19"
  instance_type   = var.instance_type
  key_name        = "devops-ulrich"
  security_groups = [aws_security_group.sg.name]
  tags            = var.instance_name_map
}