variable "datastream_groups" {
  description = "List of datastream group"
}

variable "opensearch_api" {
  description = "List of datastream group"
  type        = string
}

variable "vault_secrets" {
  description = "Map of Vault Secret Object"
  type = map(object({
    mount = string
    path  = string
  }))
}
