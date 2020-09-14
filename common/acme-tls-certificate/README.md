# Module Acme

Module for generating TLS certificates from Lets Encrypt

## Usage

```
module "acme_tls_certificate" {
  source = ".../terraform-modules/common/acme-tls-certificate"

  use_production_server_url = true
  email_address             = "egerc@github.com"
  common_name               = "acme.github.com"
  subject_alternative_names = ["alias.github.com"]
  dns_provider              = "azure"
}
```

## Inputs

| Variable Name               | Type     | Description                                                |
| ----------------------------| -------- | ---------------------------------------------------------- |
| `use_production_server_url` | _bool_   | True uses the prod environment and false uses staging.     |
| `email_address`             | _string_ | Your email address for registration.                       |
| `common_name`               | _string_ | The DNS name of the certificate.                           |
| `subject_alternative_names` | _list_   | The SANs for the certificate (if any).                     |
| `dns_provider`              | _string_ | The DNS provider for challenge (azure/route53 etc).        |

You must also provide the config block as environment variables for the DNS provider https://www.terraform.io/docs/providers/acme/r/certificate.html#using-dns-challenges


## Outputs

Once the deployments are completed successfully, the output for the current module will be in the format mentioned below:

- `certificate_url`: The full URL of the certificate within the ACME CA. Same as id.
- `certificate_domain`: The common name of the certificate.
- `private_key_pem`: The certificate's private key, in PEM format.
- `certificate_pem`: The certificate in PEM format. This does not include the issuer_pem.
- `issuer_pem`: The intermediate certificate of the issuer.
- `certificate_p12`: The certificate, intermediate, and the private key archived as a PFX file (PKCS12 format, generally used by Microsoft products).
- `registration_private_key`: The private key used to identify the account.
