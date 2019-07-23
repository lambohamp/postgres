provider "azurerm" {}

resource "azurerm_resource_group" "gl" {
  name     = "${var.rg}"
  location = "${var.location}"
}

resource "azurerm_postgresql_server" "gl" {
  depends_on          = ["azurerm_resource_group.gl"]
  name                = "${var.server_name}"
  location            = "${var.location}"
  resource_group_name = "${var.rg}"

  sku {
    name     = "B_Gen5_2"
    tier     = "Basic"
    family   = "Gen5"
    capacity = 2
  }

  storage_profile {
    storage_mb = "${var.storage}"
  }

  administrator_login          = "${var.username}"
  administrator_login_password = "${var.password}"
  version                      = "10"
  ssl_enforcement              = "Enabled"
}

resource "azurerm_postgresql_database" "gltest" {
  depends_on          = ["azurerm_postgresql_server.gl"]
  name                = "${var.db_name}"
  resource_group_name = "${var.rg}"
  server_name         = "${var.server_name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
