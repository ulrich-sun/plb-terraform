variable "instance_type" {
  type        = string
  default     = "t2.nano"
  description = "Valeur de mon instance type"
}

#variable "instance_name"{
# type= string 
#default = "ec2-ulrich"
#description = "Nom de mon instance"
#}

variable "instance_name_map" {
  type = map(any)
  default = {
    Name = "ec2-ulrich"
  }
  description = "Nom de mon instance"
}