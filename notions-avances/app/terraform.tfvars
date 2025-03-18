size          = 10
az            = "us-east-1a"
ebs_name      = "plb_ebs_ulrich"
instance_type = "t2.micro"
key_name      = "devops-ulrich"
#instance_name_map = {
#  Name = "plb_ulrich"
#}
instance_name_map = "plb_ulrich"
script_name         = "nginx"
username            = "ubuntu"
connexion_type      = "ssh"
security_group_name = "plb_sg_ulrich"
eip_name = "plb_eip"