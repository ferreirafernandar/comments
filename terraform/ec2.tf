data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

module "ec2_instances" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "2.12.0"
  name                   = "${var.prefix}"
  ami                    =  data.aws_ami.ubuntu.id
  instance_type          = "${var.instance_type}"
  key_name               = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [module.security_group.security_group_ids]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name        = "Comments API"
    Terraform   = "true"
    Environment = "Test"
  }
}
