region           = "ap-southeast-1"
cluster-name     = "eks-cluster-demo"
node-group-names = ["node-group-1"]
worker_node_instance_type     = "t2.medium"
worker_node_desired_instances = 2
worker_node_max_instances     = 4
worker_node_min_instances     = 2