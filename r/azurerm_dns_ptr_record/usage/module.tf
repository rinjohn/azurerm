module "azurerm_dns_ptr_record" {
  source = "./azurerm/r/azurerm_dns_ptr_record"

  name                = null
  records             = []
  resource_group_name = null
  tags                = {}
  ttl                 = null
  zone_name           = null

  timeouts = [{
    create = null
    delete = null
    read   = null
    update = null
  }]
}
