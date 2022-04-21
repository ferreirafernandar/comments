terraform {
    required_version = ">=1.1.8"
    required_providers {
      aws = ">=4.10.0"
      local = ">=2.2.2"
    }
    backend "s3" {
      bucket = "comments-state-bucket"
      key    = "terraform.tfstate"
      region = "us-east-1"
    }
}

provider "aws" {
  region = "us-east-1"
}

resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "comments"
  public_key = "${tls_private_key.tls_key.public_key_openssh}"

  depends_on = [
    tls_private_key.tls_key
  ]
}

resource "local_file" "key-file" {
  content  = "${tls_private_key.tls_key.private_key_pem}"
  filename = "comments.pem"

  depends_on = [
    tls_private_key.tls_key
  ]
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

module "vpc"{
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}

module "security_group" {
  source        = "clouddrove/security-group/aws"
  version       = "0.15.0"
  name          = "comments-security-group"
  environment   = "test"
  protocol      = "tcp"
  label_order   = ["name", "environment"]
  vpc_id        = module.vpc.vpc_id
  allowed_ip    = ["0.0.0.0/0"]
  allowed_ports = [22, 8000]
}

module "ec2_instances" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "2.12.0"
  name                   = "Comments"
  ami                    =  data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [module.security_group.security_group_ids]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name        = "Comments API"
    Terraform   = "true"
    Environment = "Test"
  }
}
