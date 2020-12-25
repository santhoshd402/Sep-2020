variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "description"
}
variable "subnet_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "description"
}
variable "subnet_names" {
  type        = list(string)
  default     = ["tf-sub1", "tf-sub2"]
  description = "description"
}
variable "route_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "description"
}
variable "ami_size" {
  type        = list(string)
  default     = ["t2.micro", "t2.medium"]
  description = "description"
}
#variable "my_security_group" {
#  type        = string
#  default     = "AllTraffic_NorthVirginia_SecurityGroup"
#  description = "description"
#}


