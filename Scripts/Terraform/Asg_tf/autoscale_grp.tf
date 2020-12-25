/*data "aws_vpc" "def-vpc" {
    id                      = "vpc-03078294e819b76ee"
}*/
data "aws_subnet" "subnet1" {
    id                      = "subnet-017ff3278ee13faea"
}
data "aws_subnet" "subnet2" {
    id                      = "subnet-0698333e0ee399d5b"
}
data "aws_subnet" "subnet3" {
    id                      = "subnet-076aa36a76b4fad4b"
}

resource "aws_autoscaling_group" "tf-asg" {
    name                    = "tf-asg"
    launch_configuration    = aws_launch_configuration.tf_lconfig.id
    vpc_zone_identifier     = [data.aws_subnet.subnet1.id, data.aws_subnet.subnet2.id, data.aws_subnet.subnet3.id]
    health_check_grace_period = 300
    max_size                = 5
    min_size                = 2
    desired_capacity        = 4
    health_check_type       = "EC2"
   
}
