module "azurerm_data_factory_linked_service_sql_server" {
  source = "./azurerm/r/azurerm_data_factory_linked_service_sql_server"

  additional_properties    = {}
  annotations              = []
  connection_string        = null
  data_factory_name        = null
  description              = null
  integration_runtime_name = null
  name                     = null
  parameters               = {}
  resource_group_name      = null

  timeouts = [{
    create = null
    delete = null
    read   = null
    update = null
  }]
}
