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

terraform {
  backend "s3" {
    region = "us-east-1"
    access_key = "AKIA5OYEFMPBYK57WYPG"
    secret_key = "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"
    bucket = "plb-backend"
    key = "plb.tfstate"
    
  }
}

resource "aws_instance" "web" {
  ami             = "ami-04b4f1a9cf54c11d0"
  instance_type   = var.instance_type
  key_name        = "devops-ulrich"
  security_groups = [aws_security_group.sg.name]
  tags            = var.instance_name_map

  provisioner "local-exec" {
    command = "echo PUBLIC_IP: ${self.public_ip} ID: ${self.id} AZ: ${self.availability_zone} > infos_ec2.txt"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./devops-ulrich.pem")
      host        = self.public_ip
    }
    #    script = ["./nginx.sh"]
  }
  depends_on = [ aws_security_group.sg ]
}
