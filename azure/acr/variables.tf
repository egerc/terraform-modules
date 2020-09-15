variable "resource_group_name" {
  type = string
}

variable "name" {
  type = string
}

variable "create_acr" {
  type = boolean
  description = "Set to true to create an ACR"
  default = false
}

variable "resource_tags" {
  description = "Map of tags to apply to taggable resources in this module.  By default the taggable resources are tagged with the name defined above and this map is merged in"
  type        = map(string)
  default     = {}
}
