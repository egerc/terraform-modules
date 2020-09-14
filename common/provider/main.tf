terraform {
  required_version = ">= 0.12"
}

provider "acme" { 
  version = "~> 1.5" 
}

provider "tls" { 
  version = "~> 2.2" 
}
