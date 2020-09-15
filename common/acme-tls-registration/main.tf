module "provider" {
  source = "../provider"
}

provider "acme" {
  server_url = local.acme_server_url
}

resource "tls_private_key" "reg_private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.reg_private_key.private_key_pem
  email_address   = var.email_address
}
