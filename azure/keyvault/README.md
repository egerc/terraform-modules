# Module Azure KeyVault

Module for creating and managing Azure KeyVaults.

## Usage

```
module "keyvault" {
  source = ".../terraform-modules/azure/keyvault"

  name                  = "test-keyvault"
  resource_group_name   = "test-rg"
  keyvault_sku          = "standard"
  subnet_id_whitelist   = ["id_of_subnet_to_whitelist"]
  resource_ip_whitelist = ["ip_address_to_whitelist"]

  resource_tags = {
    environment = "test-environment"
  }
}

```

## Inputs

| Variable Name           | Type     | Description                                                |
| ---------------------   | -------- | ---------------------------------------------------------- |
| `name`                  | _string_ | The name of the KeyVault to create.                        |
| `resource_group_name`   | _string_ | Resource group the KeyVault will be created in.            |
| `keyvault_sku`          | _string_ | SKU of the KeyVault (standard or premium).                 |
| `subnet_id_whitelist`   | _list_   | (optional) List of subnet ids to whitelist.                |
| `resource_ip_whitelist` | _list_   | (optional) List of ips / ip ranges to whitelist.           |
| `resource_tags`         | _list_   | Map of tags to apply to taggable resources in this module. |


## Outputs

Once the deployments are completed successfully, the output for the current module will be in the format mentioned below:

- `keyvault_id`: The id of the Keyvault.
- `keyvault_uri`: The uri of the keyvault.
- `keyvault_name`: The name of the Keyvault.
