module "azurerm_network_interface_application_security_group_association" {
  source = "./azurerm/r/azurerm_network_interface_application_security_group_association"

  application_security_group_id = null
  network_interface_id          = null

  timeouts = [{
    create = null
    delete = null
    read   = null
    update = null
  }]
}
