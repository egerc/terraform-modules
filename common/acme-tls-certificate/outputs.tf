output "certificates" {
  value = {
    for certificate in acme_certificate.certificate:
    certificate.certificate_domain => {
      "private_key": base64encode(certificate.private_key_pem), "cert": base64encode(certificate.certificate_pem)
    }
  }
  sensitive = true
}