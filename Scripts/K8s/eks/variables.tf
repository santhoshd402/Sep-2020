variable "region" {
  description = "give aws region code"
  type        = string
}

variable "node-group-names" {
  description = "provide node group names"
  type        = list(string)
}
variable "cluster-name" {
  description = "provide eks cluser name"
  type    = string
}
variable "worker_EBS_volume_size" {
  description = "worker node EBS volume size"
  type        = number  
}
variable "worker_node_instance_type" {
  description = "worker_node_instance_type"
#  type        = list(string)
  type        = string
}

variable "worker_node_desired_instances" {
  description = "provide eks worker_node_desired_instances"
  type        = string
}
variable "worker_node_max_instances" {
  description = "provide eks worker_node_max_instances"
  type        = string
}

variable "worker_node_min_instances" {
  description = "provide eks worker_node_max_instances"
  type        = string
}




