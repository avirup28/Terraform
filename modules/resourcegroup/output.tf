# output "rgname" {
#     value = azurerm_resource_group.newrg.name
# }
output "rgloc" {
    value    = data.azurerm_resource_group.rg.location
}

output "rg" {
     value = data.azurerm_resource_group.rg.name
}
