variable "use_production_server_url" {
  default = false
  description = "False will use Lets Encrypt staging server, this is recommended for testing. Change to true when ready to put the app in to production."
}

variable "email_address" {
  type = string
  description = "The email address used for the account."
}

variable "common_name" {
  type = string
  description = "The common name for the certificate."
}

variable "subject_alternative_names" {
  type = list(string)
  default = []
  description = "Any alternative names/aliases that will be used."
}

variable "dns_provider" {
  type = string
  default = "azure"
  description = "The DNS provider, required for DNS validation. You must also provide the config block as environment variables https://www.terraform.io/docs/providers/acme/r/certificate.html#using-dns-challenges"
}

locals {
  acme_server_url = var.use_production_server_url ? "https://acme-v02.api.letsencrypt.org/directory" : "https://acme-staging-v02.api.letsencrypt.org/directory"


}