variable "action" {
  description = "(required)"
  type        = string
}

variable "azure_firewall_name" {
  description = "(required)"
  type        = string
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "priority" {
  description = "(required)"
  type        = number
}

variable "resource_group_name" {
  description = "(required)"
  type        = string
}

variable "rule" {
  description = "nested mode: NestingList, min items: 1, max items: 0"
  type = set(object(
    {
      description = string
      fqdn_tags   = set(string)
      name        = string
      protocol = list(object(
        {
          port = number
          type = string
        }
      ))
      source_addresses = set(string)
      target_fqdns     = set(string)
    }
  ))
}

variable "timeouts" {
  description = "nested mode: NestingSingle, min items: 0, max items: 0"
  type = set(object(
    {
      create = string
      delete = string
      read   = string
      update = string
    }
  ))
  default = []
}

