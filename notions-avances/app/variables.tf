variable "size" {

}
variable "az" {

}

variable "ebs_name" {

}
variable "instance_type" {
  description = "Puissance de la vm"
}
variable "key_name" {
  description = "nom de la paire de cles"
}
variable "instance_name_map" {
  description = "nom de l'instance"
}
variable "script_name" {
  description = "nom du script"
}
variable "connexion_type" {
  description = "type de connexion"
}
variable "username" {
  description = "nom de l'utilisateur"
}
variable "security_group_name" {
  description = "nom de la sg"
}
variable "eip_name" {
  
}




variable "region" {
  type = string 
  default = "us-east-1"
}
variable "instance_type_choice" {
  type = map 
  default = {
    "us-east-1" = "t2.micro"
    "us-west-1" = "t3.micro"
    "us-west-2" = "t2.medium"
    "eu-west-1" = "t3.medium"
  }
}


variable "ami" {
  type = map 
  default = {
    "us-east-1" = "ami-12345543"
    "us-west-1" = "ami-654321345"
    "us-west-2" = "ami-54335654"
    "eu-west-1" = "ami-9876548"
  }
}

variable "stack" {
  default = "test"
}