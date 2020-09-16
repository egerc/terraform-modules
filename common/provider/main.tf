terraform {
  required_version = ">= 0.12"
}

provider "acme" {
  version = "~> 1.5"
}

provider "tls" {
  version = "~> 2.2"
}

provider "random" {
  version = "~> 2.3"
}

provider "external" {
  version = "~> 1.2"
}