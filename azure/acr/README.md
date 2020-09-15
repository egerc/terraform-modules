# Module Azure Container Registry

Module for creating and managing Azure Container Registry.

## Usage

```
module "acr" {
  source = ".../terraform-modules/azure/acr"

  name                = "test-acr"
  resource_group_name = "test-rg"
  resource_tags = {
    environment = "test-environment"
  }
}

```

## Inputs

| Variable Name           | Type     | Description                                                |
| ---------------------   | -------- | ---------------------------------------------------------- |
| `name`                  | _string_ | The name of the ACR to create.                             |
| `resource_group_name`   | _string_ | Resource group the ACR will be created in.                 |
| `resource_tags`         | _list_   | Map of tags to apply to taggable resources in this module. |


## Outputs

Once the deployments are completed successfully, the output for the current module will be in the format mentioned below:

- `id`: The id of the ACR.
