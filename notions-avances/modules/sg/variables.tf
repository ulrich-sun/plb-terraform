variable "security_group_name" {
  description = "nom de la sg"
}

 variable "sg_ports"{
  type = list 
  default = [22, 443, 8080, 80, 30000]
 }