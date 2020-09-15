# Module Acme TLS Registration

Module for generating accounton Lets Encrypt

## Usage

```
module "acme_tls_registration" {
  source = ".../terraform-modules/common/acme-tls-registration"

  use_production_server_url = true
  email_address             = "egerc@github.com"
}
```

## Inputs

| Variable Name               | Type     | Description                                                |
| ----------------------------| -------- | ---------------------------------------------------------- |
| `use_production_server_url` | _bool_   | True uses the prod environment and false uses staging.     |
| `email_address`             | _string_ | Your email address for registration.                       |




## Outputs

Once the deployments are completed successfully, the output for the current module will be in the format mentioned below:

- `registration_private_key`: The private key used to identify the account. This will be needed to request certificates with the acme-tls-certificate module
