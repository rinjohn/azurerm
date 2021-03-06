terraform {
  required_providers {
    azurerm = ">= 2.0.0"
  }
}

resource "azurerm_iothub_consumer_group" "this" {
  eventhub_endpoint_name = var.eventhub_endpoint_name
  iothub_name            = var.iothub_name
  name                   = var.name
  resource_group_name    = var.resource_group_name

  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      create = timeouts.value["create"]
      delete = timeouts.value["delete"]
      read   = timeouts.value["read"]
      update = timeouts.value["update"]
    }
  }

}

