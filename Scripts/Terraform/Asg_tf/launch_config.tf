data "aws_security_group" "tf-sec-grp" {
    name                    = "default"
} 

resource "aws_launch_configuration" "tf_lconfig" {
    name                        = "tf_lconfig"
    image_id                    = aws_ami_from_instance.tf-ami.id
    instance_type               = "t2.micro"
    security_groups             = [data.aws_security_group.tf-sec-grp.id]
    key_name                    = "NvirginiaKeypair"
    associate_public_ip_address = true

}

output "launch_config_id" {
    value                       = aws_launch_configuration.tf_lconfig.id

}