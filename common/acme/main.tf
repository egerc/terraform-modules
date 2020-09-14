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

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = var.common_name
  subject_alternative_names = var.subject_alternative_names

  dns_challenge {
    provider = var.dns_provider
  }
}