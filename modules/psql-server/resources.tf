resource "null_resource" "depends_on" {
  triggers {
    depends_on = "${join("", var.depends_on)}"
  }
}

resource "azurerm_postgresql_server" "gl" {
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

  depends_on = [
    "null_resource.depends_on",
  ]
}
