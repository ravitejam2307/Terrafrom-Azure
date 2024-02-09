output "rgId" {
    description = "Id of the RG"
    value = data.azurerm_resource_group.localrg.id
}

output "rglocation" {
    description = "This is the location of your RG"
    value = data.azurerm_resource_group.localrg.location
}