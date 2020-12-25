locals {
  common_tags = {
    Name  = "FromTF_Automation"
  }
}
resource "aws_vpc" "tf-vpc" {
    cidr_block              = var.cidr_block
    enable_dns_hostnames    = true
    tags = local.common_tags

}
resource "aws_subnet" "tf-sub" {
#    count                   = 2  or
    count                   = length(var.subnet_cidr)
    cidr_block              = var.subnet_cidr[count.index]
    vpc_id                  = aws_vpc.tf-vpc.id
    tags                    = {
        Name                = var.subnet_names[count.index]
    }
}
#resource "aws_subnet" "tf-sub2" {
#    cidr_block              = "10.0.2.0/24"
#    vpc_id                  = aws_vpc.tf-vpc.id
#    tags                    = local.common_tags
#}
resource "aws_internet_gateway" "tf-gateway" {
    vpc_id                  = aws_vpc.tf-vpc.id
    tags                    = local.common_tags
}
resource "aws_route_table" "tf-routetable" {
    vpc_id                  = aws_vpc.tf-vpc.id
    route {
    cidr_block              = var.route_cidr
    gateway_id              = aws_internet_gateway.tf-gateway.id
  }
    tags                    = local.common_tags
}
resource "aws_route_table_association" "tf-rt-association" {
    subnet_id               = aws_subnet.tf-sub[0].id
    route_table_id          = aws_route_table.tf-routetable.id
}
resource "aws_route_table_association" "tf-rt-association2" {
    subnet_id               = aws_subnet.tf-sub[1].id
    route_table_id          = aws_route_table.tf-routetable.id
}
#data "aws_security_group" "tf-sec-grp" {
#    name                    = var.my_security_group
#} (this will useful only when subnet and sg in same network, here subnet in diff nw)
# Usage: vpc_security_group_ids  = [data.aws_security_group.tf-sec-grp.id]

resource "aws_security_group" "tf-sec-grp" {
    name                    = "tf-sec-grp"
    description             = "Allow all Traffic for testing"
    vpc_id                  = aws_vpc.tf-vpc.id
    ingress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
    }
    egress {
    from_port               = 0
    to_port                 = 0
    protocol                = "-1"
    cidr_blocks             = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "tf-web1" {
    ami                     = "ami-0817d428a6fb68645"
    instance_type           = var.ami_size[0]
    subnet_id               = aws_subnet.tf-sub[0].id
    associate_public_ip_address = true
    vpc_security_group_ids  = [aws_security_group.tf-sec-grp.id]
    key_name                = "NvirginiaKeypair"
    tags                    = local.common_tags
    connection  {
    type                    = "ssh"
    user                    = "ubuntu"
    private_key             = file("NvirginiaKeypair.pem")
    host                    = aws_instance.tf-web1.public_dns
    }
    provisioner "remote-exec" {
    script                  = "script.sh"
   # inline                  = [
   # "sudo apt-get update ",
   # "sleep 10s",
   # "sudo apt-get install openjdk-8-jdk -y"
   # ]
    }  
    depends_on              = [aws_security_group.tf-sec-grp]
}






