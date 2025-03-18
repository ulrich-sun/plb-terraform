data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["*ubuntu-bionic*"]
  }
}



module "ec2" {
  source              = "../modules/ec2"
  ami                 = data.aws_ami.ubuntu.id
  instance_type       = var.instance_type
  az                  = var.az
  key_name            = var.key_name
  security_group_name = module.sg.sg_name
  instance_name_map   = var.instance_name_map
  script_name         = var.script_name
  connexion_type      = var.connexion_type
  username            = var.username
  instance_count = 5
  depends_on          = [module.sg]
}

module "sg" {
  source              = "../modules/sg"
  security_group_name = var.security_group_name
}

# module "eip" {
#   source      = "../modules/eip"
#   instance_id = module.ec2.instance_id
#   eip_name = var.eip_name
#   depends_on  = [module.ec2]
# }
# module "ebs" {
#   source      = "../modules/ebs"
#   instance_id = module.ec2.instance_id
#   size        = var.size
#   az          = var.az
#   ebs_name    = var.ebs_name
#   depends_on  = [module.ec2]
# }