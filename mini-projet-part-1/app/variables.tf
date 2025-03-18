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
variable "az" {
}
variable "security_group_name" {
  description = "nom de la sg"
}