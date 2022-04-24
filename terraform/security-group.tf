module "security_group" {
  source        = "clouddrove/security-group/aws"
  version       = "0.15.0"
  name          = "${var.prefix}-security-group"
  environment   = "test"
  protocol      = "tcp"
  label_order   = ["name", "environment"]
  vpc_id        = module.vpc.vpc_id
  allowed_ip    = ["0.0.0.0/0"]
  allowed_ports = [22, 8000, 8080, 6379, 3000, 9090]
}
