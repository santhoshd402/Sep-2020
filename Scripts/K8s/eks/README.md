# Setting up AWS EKS (Hosted Kubernetes)

See https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html for full guide

### prerequisites
## Download kubectl
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin
```

### install AWS CLI version2

```
# the below commnands are usefuel to install AWS CLI on LINUX
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

## Download the aws-iam-authenticator when You are using AWS CLI version less than 1.6 version otherwise not needed.
* Note: To know exexute terraform code any version of AWS CLI is sufficient but to connect to EKS clsuter we have to exexute
  * aws eks --region <region-cde> update-kubeconfig --name <cluster-name>
```
wget https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.3.0/heptio-authenticator-aws_0.3.0_linux_amd64
chmod +x heptio-authenticator-aws_0.3.0_linux_amd64
sudo mv heptio-authenticator-aws_0.3.0_linux_amd64 /usr/local/bin/heptio-authenticator-aws
```



## Terraform apply
```
terraform init
terraform apply
```

## AWS EKS cluster authentication from workstation
```
aws eks --region <region> update-kubeconfig --name <cluster name>
```
   * [refer link to know more about EKS cluster authentication](https://aws.amazon.com/premiumsupport/knowledge-center/eks-cluster-connection/) 



## See nodes coming up
```
kubectl get nodes
```

## Destroy
Make sure all the resources created by Kubernetes are removed (LoadBalancers, Security groups).
```
terraform destroy -auto-approve
```
