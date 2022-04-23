variable "prefix" {
  description = "Prefix name of application"
  type = string
  default = "comments"
}

variable "instance_type" {
  description = "Instace type in AWS"
  type = string
  default = "t2.micro"
}

variable "region" {
  description = "Region in AWS"
  type = string
  default = "us-east-1"
}

variable "vpc_name" {
  description = "Comments VPC"
  type        = string
  default     = "comments-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for Comments VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for Comments VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for Comments VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for Comments VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for Comments VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Name        = "Commenets API"
    Terraform   = "true"
    Environment = "test"
  }
}