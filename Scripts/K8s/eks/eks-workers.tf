resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.demo.name
  count           = length(var.node-group-names)
  node_group_name = var.node-group-names[count.index]
#  node_group_name = var.node-group-names
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = module.vpc.public_subnets
  disk_size       = var.worker_EBS_volume_size
  instance_types  = [var.worker_node_instance_type]


  scaling_config {
    desired_size = var.worker_node_desired_instances
    max_size     = var.worker_node_max_instances
    min_size     = var.worker_node_min_instances
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}