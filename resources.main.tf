provider "azurerm" {
    features {

    } 
}

data "azurerm_resource_group" "localrg" {
    name = "demorgtf"
    location  = "centralindia"
}


#Azure backend
terraform {
  backend "azurerm" {
    resource_group_name = var.tfstaterg
    storage_account_name = var.tfstatestorage
    container_name = var.tfstateconatiner
    key = "${var.teamname}.tfstate"
  }
}

resource "azurerm_resource_group" "localrg" {
    name = "${var.teamname}-rg"
    location  =  var.location
}
resource "azurerm_service_plan" "localplan" {
    name = "${var.teamname}-${var.planname}"
    resource_group_name = data.azurerm_resource_group.localrg.name
    location = data.azurerm_resource_group.loalrg.location
    sku_name = "S1"
    os_type = "Windows"
}

resource "azurerm_windows_web_app" "localapplication" {
    name = "${var.teamname}${var.sitename}abcxyz${var.regioncode}"
    resource_group_name = data.azurerm_resource_group.localrg.name
    location = data.azurerm_resource_group.localrg.location
    service_plan_id = azurerm_service_plan.localplan.id

site_config {

}
}

resource "azurerm_windows_virtual_machine" "vmname" {

    count = var.count
    name = "demovmtf${count.index}"
    location = data.azurerm_resource_group.localrg.location
    size = "Standard_B1s"
    admin_username = "adminuser"
    admin_password = "P@ssword1234"
    network_interface_ids = [azurerm_network_interface.nic1.id]

    source_image_reference {
      publisher = "MicrosoftWindowsServer"
      offer = "WindowsServer"
      sku = "2019-Datacenter"
      version = "latest"
    }

    os_disk{
        storage_account_type = "Standard_LRS"
        caching = "ReadWrite"
    }







    }
resource "azurerm_storage_account" "localstoragename" {
    
    name = "${var.teamname}storxyzabc000${var.regioncode}"
    resource_group_name =  azurerm_resource_group.localrgname.name
    location = azurerm_resource_group.localrgname.location
    account_tier =  "Standard"
    account_replication_type =  "var.sku"

}


#terraform plan -var-file=".\development\dev.tfvars" -out=".\development\dev.tfplan" -state=".\development\dev.tfstate"

# terraform apply -state-out=".\development\dev.tfstate" ".\development\dev.tfplan"