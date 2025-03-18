resource "aws_instance" "web" {
  ami             = lookup(var.ami,var.region)
  instance_type   = var.instance_type
  count = var.instance_count
  key_name        = var.key_name
  availability_zone = var.az
  security_groups = [var.security_group_name]
  #tags            = {
  #  Name = "${var.instance_name_map}.${count.index}"
  #}

  tags = {
    Name = element(var.instance_name_map,count.index)
  }

#  provisioner "local-exec" {
#    command = "echo PUBLIC_IP: ${aws_instance.web[*].public_ip} ID: ${aws_instance.web[*].id} AZ: ${aws_instance.web[*].availability_zone} >> ip_count_ec2.txt"
#  }
  connection {
    type        = var.connexion_type
    user        = var.username
    private_key = file("./keypair/${var.key_name}.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    scripts = ["./scripts/${var.script_name}.sh"]
  }
  provisioner "file" {
    source = "./config/motd"
    destination = "/tmp/motd"
  }
}


resource "null_resource" "ip" {
  provisioner "local-exec" {
    command = "echo PUBLIC_IP: ${aws_instance.web[*].public_ip} ID: ${aws_instance.web[*].id} AZ: ${aws_instance.web[*].availability_zone} >> ip_count_ec2.txt"
  }
  depends_on = [ aws_instance.web ]
}