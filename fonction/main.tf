variable "test_function" {
  type = map 
  default = {
    "value1" = "key1"
    "value2" = "key2"
  }
}
variable "list" {
  type = list 
  default = [1, 2, 3, 4]
}