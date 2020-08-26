# ==================== Variables

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}


variable "iaas" {
  description = "which cloud? (aws/azure/gcp)"
}

variable "tile_configuration_values" {
  description = "configuration values in json format that will be used by 'om configure-product' to configure the tile"
}

variable "map_extratile_configuration" {
  description = "extra tile configs values to merge into tile_configuration_values"
  default     = {}
  type        = map(string)
}

variable "vm_extensions_configuration_in_yml" {
  description = "vm-extension config if any as specified here: https://github.com/pivotal-cf/om/blob/main/docs/create-vm-extension/README.md in yml format "
  default     = ""
  type = string
}
variable "tile_slug" {

}
variable "tile_version" {

}
variable "glob" {
  description = "The glob of the file to download from Pivotal Network"
  default     = ".pivotal"
}

variable "om_product" {
  description = "The name of the product in OpsManager, if it differs from the product slug"
  default     = ""
}




