output "certificate_url" {
  description = "The full URL of the certificate within the ACME CA. Same as id."
  value       = acme_certificate.certificate.certificate_url
}
output "certificate_domain" {
  description = "The common name of the certificate."
  value       = acme_certificate.certificate.certificate_domain
}
output "private_key_pem" {
  description = "The certificate's private key, in PEM format."
  value       = acme_certificate.certificate.private_key_pem
}
output "certificate_pem" {
  description = "The certificate in PEM format. This does not include the issuer_pem."
  value       = acme_certificate.certificate.certificate_pem
}
output "issuer_pem" {
  description = "The intermediate certificate of the issuer."
  value       = acme_certificate.certificate.issuer_pem
}
output "certificate_p12" {
  description = "The certificate, intermediate, and the private key archived as a PFX file (PKCS12 format, generally used by Microsoft products)."
  value       = acme_certificate.certificate.certificate_p12
}

output "registration_private_key" {
  description = "The private key used to identify the account."
  value       = tls_private_key.reg_private_key.private_key_pem
}
