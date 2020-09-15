output "registration_private_key" {
  description = "The private key used to identify the account. Used in further certificate requests"
  value       = tls_private_key.reg_private_key.private_key_pem
}
