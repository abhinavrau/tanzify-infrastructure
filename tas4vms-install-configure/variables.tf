# ==================== Variables

variable ops_manager_ssh_private_key {
  type = string
}

variable "ops_manager_dns" {
  type = string
}


variable "iaas" {}

variable "tas4vms_configuration_values" {
  description = "configuration values in yaml/json format that will be used by 'om configure-product' to configure the tile"
}

variable "tas4vms_slug" {
  default = "elastic-runtime"
}
variable "tas4vms_tile_version" {
  default = "2.9.9"
}
variable "glob" {
  description = "The glob of the file to download from Pivotal Network. srt for small footprint. cf otherwise"
  default     = "srt"
}

variable "om_product" {
  description = "The name of the product in OpsManager, if it differs from the product slug"
  default     = "cf"
}




