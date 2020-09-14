variable "name" {
  description = "Name of the keyvault to create"
  type        = string
}

variable "keyvault_sku" {
  description = "SKU of the keyvault to create"
  type        = string
  default     = "standard"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name that the KeyVault will be created in."
}

variable "keyvault_key_permissions" {
  description = "Permissions that the service principal has for accessing keys from KeyVault"
  type        = list(string)
  default     = ["create", "delete", "get"]
}

variable "keyvault_secret_permissions" {
  description = "Permissions that the service principal has for accessing secrets from KeyVault"
  type        = list(string)
  default     = ["set", "delete", "get", "list"]
}

variable "keyvault_certificate_permissions" {
  description = "Permissions that the service principal has for accessing certificates from KeyVault"
  type        = list(string)
  default     = ["create", "delete", "get", "list"]
}

variable "resource_tags" {
  description = "Map of tags to apply to taggable resources in this module.  By default the taggable resources are tagged with the name defined above and this map is merged in"
  type        = map(string)
  default     = {}
}

variable "subnet_id_whitelist" {
  description = "If supplied this represents the subnet IDs that should be allowed to access this resource"
  type        = list(string)
  default     = []
}

variable "resource_ip_whitelist" {
  description = "A list of IPs and/or IP ranges that should have access to the provisioned keyvault"
  type        = list(string)
  default     = []
}
