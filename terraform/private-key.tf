resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${var.prefix}"
  public_key = "${tls_private_key.tls_key.public_key_openssh}"

  depends_on = [
    tls_private_key.tls_key
  ]
}

resource "local_file" "key-file" {
  content  = "${tls_private_key.tls_key.private_key_pem}"
  filename = "${var.prefix}.pem"

  depends_on = [
    tls_private_key.tls_key
  ]
}