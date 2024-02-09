variable "count" {
    type = number
}

variable "rgname" {
    type = string
    description = "This is the name of the resource group"
}

variable "location" {
    type =  string
    description = "This is the name of the location"
}  

variable "teamname" {
    type =  string
    description = "This is the name of the dev environment"
}  

variable "regioncode" {
    type =  string
    description = "This is the region code of the storage"
}  

variable "tfstaterg" {
    type = string
}

variable "tfstatestorage" {
    type = "string"
}

variable "tfstatecontainer" {
    type = "string"
}

variable "planname" {
    type = "string"
}

variable "sitename" {
    type = "string"
}
