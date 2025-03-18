resource "aws_instance" "web" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  availability_zone = var.az
  security_groups = [var.security_group_name]
  tags            = var.instance_name_map

  provisioner "local-exec" {
    command = "echo PUBLIC_IP: ${self.public_ip} ID: ${self.id} AZ: ${self.availability_zone} > ip_ec2.txt"
  }
  provisioner "remote-exec" {
    script = ["./scripts/${var.script_name}.sh"]
    connection {
      type        = var.connexion_type
      user        = var.username
      private_key = file("./keypair/${var.key_name}.pem")
      host        = self.public_ip
    }
  }
}
