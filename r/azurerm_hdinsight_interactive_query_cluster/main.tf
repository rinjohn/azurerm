terraform {
  required_providers {
    azurerm = ">= 2.0.0"
  }
}

resource "azurerm_hdinsight_interactive_query_cluster" "this" {
  cluster_version     = var.cluster_version
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags
  tier                = var.tier

  dynamic "component_version" {
    for_each = var.component_version
    content {
      interactive_hive = component_version.value["interactive_hive"]
    }
  }

  dynamic "gateway" {
    for_each = var.gateway
    content {
      enabled  = gateway.value["enabled"]
      password = gateway.value["password"]
      username = gateway.value["username"]
    }
  }

  dynamic "roles" {
    for_each = var.roles
    content {

      dynamic "head_node" {
        for_each = roles.value.head_node
        content {
          password           = head_node.value["password"]
          ssh_keys           = head_node.value["ssh_keys"]
          subnet_id          = head_node.value["subnet_id"]
          username           = head_node.value["username"]
          virtual_network_id = head_node.value["virtual_network_id"]
          vm_size            = head_node.value["vm_size"]
        }
      }

      dynamic "worker_node" {
        for_each = roles.value.worker_node
        content {
          min_instance_count    = worker_node.value["min_instance_count"]
          password              = worker_node.value["password"]
          ssh_keys              = worker_node.value["ssh_keys"]
          subnet_id             = worker_node.value["subnet_id"]
          target_instance_count = worker_node.value["target_instance_count"]
          username              = worker_node.value["username"]
          virtual_network_id    = worker_node.value["virtual_network_id"]
          vm_size               = worker_node.value["vm_size"]
        }
      }

      dynamic "zookeeper_node" {
        for_each = roles.value.zookeeper_node
        content {
          password           = zookeeper_node.value["password"]
          ssh_keys           = zookeeper_node.value["ssh_keys"]
          subnet_id          = zookeeper_node.value["subnet_id"]
          username           = zookeeper_node.value["username"]
          virtual_network_id = zookeeper_node.value["virtual_network_id"]
          vm_size            = zookeeper_node.value["vm_size"]
        }
      }

    }
  }

  dynamic "storage_account" {
    for_each = var.storage_account
    content {
      is_default           = storage_account.value["is_default"]
      storage_account_key  = storage_account.value["storage_account_key"]
      storage_container_id = storage_account.value["storage_container_id"]
    }
  }

  dynamic "storage_account_gen2" {
    for_each = var.storage_account_gen2
    content {
      filesystem_id                = storage_account_gen2.value["filesystem_id"]
      is_default                   = storage_account_gen2.value["is_default"]
      managed_identity_resource_id = storage_account_gen2.value["managed_identity_resource_id"]
      storage_resource_id          = storage_account_gen2.value["storage_resource_id"]
    }
  }

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

