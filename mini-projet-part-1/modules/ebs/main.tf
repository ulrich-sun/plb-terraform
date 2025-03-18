resource "aws_ebs_volume" "ebs" {
  availability_zone = var.az
  size              = var.size

  tags = {
    Name = var.ebs_name
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = var.instance_id
}