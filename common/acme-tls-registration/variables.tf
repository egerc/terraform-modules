variable "use_production_server_url" {
  default     = false
  description = "False will use Lets Encrypt staging server, this is recommended for testing. Change to true when ready to put the app in to production."
}

variable "email_address" {
  type        = string
  description = "The email address used for the account."
}

locals {
  acme_server_url = var.use_production_server_url ? "https://acme-v02.api.letsencrypt.org/directory" : "https://acme-staging-v02.api.letsencrypt.org/directory"
}

