resource "null_resource" "depends_on" {
  triggers {
    depends_on = "${join("", var.depends_on)}"
  }
}

resource "azurerm_postgresql_database" "gltest" {
  name                = "${var.db_name}"
  resource_group_name = "${var.rg}"
  server_name         = "${var.server_name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"

  depends_on = [
    "null_resource.depends_on",
  ]
}
