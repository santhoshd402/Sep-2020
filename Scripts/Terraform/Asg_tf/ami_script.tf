resource "aws_ami_from_instance" "tf-ami" {
  name               = "tf-ami"
  source_instance_id = "i-041e25cb27f2750fe"
  tags               = {
      name           = "tf-ami"
  }
}