resource "tls_private_key" "key" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "my-key"
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_file" "ssh_private_key" {
  content              = tls_private_key.key.private_key_pem
  filename             = "${aws_key_pair.key_pair.key_name}.pem"
  file_permission      = "400"
  directory_permission = "400"
}
