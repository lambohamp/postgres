resource "azurerm_resource_group" "gl" {
  name     = "${var.rg}"
  location = "${var.location}"
}
