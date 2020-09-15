module "provider" {
  source = "../provider"
}

provider "acme" {
  server_url = local.acme_server_url
}

resource "acme_certificate" "certificate" {
  count = length(var.common_name)

  account_key_pem           = var.registration_private_key
  common_name               = var.common_name[count.index]
  subject_alternative_names = var.subject_alternative_names[count.index]

  dns_challenge {
    provider = var.dns_provider
  }
}