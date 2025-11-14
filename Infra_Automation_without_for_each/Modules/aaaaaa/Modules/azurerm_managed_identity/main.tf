# data "azurerm_subscription" "current" {}

# resource "azurerm_virtual_machine" "mi" {
#   # ...

#   identity {
#     type = "SystemAssigned"
#   }
# }

# data "azurerm_role_definition" "contributor" {
#   name = "Contributor"
# }

# resource "azurerm_role_assignment" "example" {
#   scope              = data.azurerm_subscription.current.id
#   role_definition_id = "${data.azurerm_subscription.current.id}${data.azurerm_role_definition.contributor.id}"
#   principal_id       = azurerm_virtual_machine.mi.identity[0].principal_id
# }