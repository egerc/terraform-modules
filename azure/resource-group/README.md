# Module Azure Resource Group

Module for creating and managing Azure Resource Groups.

## Usage

```
module "resource_group" {
  source = ".../terraform-modules/azure/resource-group"

  name         = "test-rg"
  location     = "westeurope"
  environment  = "dev"
  is_no_delete = true
  is_read_only = false
  
  resource_tags = {
    environment = "test-environment"
  }
}
```

## Inputs

| Variable Name   | Type     | Description                                                |
| --------------- | -------- | ---------------------------------------------------------- |
| `name`          | _string_ | The name of the web app service.                           |
| `location`      | _string_ | The location of the resource group.                        |
| `environment`   | _string_ | The name of the environment this resource group is for.    |
| `is_no_delete`  | _string_ | Prevent resource group deletion with a delete lock.        |
| `is_read_only`  | _string_ | Make resource group read only with a readonly lock.        |
| `resource_tags` | _list_   | Map of tags to apply to taggable resources in this module. |


## Outputs

Once the deployments are completed successfully, the output for the current module will be in the format mentioned below:

- `name`: The name of the Resource Group.
- `location`: The location of the Resource Group.
- `id`: The id of the Resource Group.
- `random`: A random string derived from the Resource Group.
