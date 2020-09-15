# Module Azure VNET

Module for creating and managing Azure VNets and Subnets

## Usage

```
module "network" {
    source = ".../terraform-modules/azure/vnet"

    name                = "app-vnet"
    resource_group_name = "app-rg"
    address_space       = "10.0.1.0/24"
    dns_servers         = []
    subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
    subnet_names        = ["app-snet", "sys-snet"]

    resource_tags = {
      environment = "test-environment"
    }
}
```

## Inputs

| Variable Name                     | Type       | Description                          | 
| --------------------------------- | ---------- | ------------------------------------ |
| `name`                            | _string_   | The name of the web app service.     |
| `resource_group_name`             | _string_   | The name of an existing resource group. |
| `resource_tags`                   | _list_     | Map of tags to apply to taggable resources in this module. |
| `address_space`                   | _string_   | The address space that is used by the virtual network. Default: `10.0.0.0/16` |
| `dns_servers`                     | _list_     | The DNS servers to be used with vNet. |
| `subnet_prefixes`                 | _list_     | The address prefix to use for the subnet. Default: `["10.0.1.0/24"]`
| `subnet_names`                    | _list_     | A list of public subnets inside the vNet. Default: `["subnet1"]`


## Outputs

Once the deployments are completed successfully, the output for the current module will be in the format mentioned below:

- `id`: The virtual network Id.
- `name`: The virtual network name.
- `address_space`: The address space of the virtual network.
- `subnets`: The ids of subnets created inside the virtual network.
