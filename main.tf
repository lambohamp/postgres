provider "azurerm" {}

module "Resource_group" {
  source   = "./modules/resource-group"
  rg       = "${var.rg}"
  location = "${var.location}"
}

module "psql-server" {
  source      = "./modules/psql-server"
  server_name = "${var.server_name}"
  location    = "${var.location}"
  storage     = "${var.storage}"
  username    = "${var.username}"
  rg          = "${var.rg}"
  password    = "${var.password}"
  depends_on  = ["${module.Resource_group.id}"]
}

module "psql-database" {
  source      = "./modules/psql-database"
  server_name = "${var.server_name}"
  rg          = "${var.rg}"
  db_name     = "${var.db_name}"
  depends_on  = ["${module.psql-server.id}"]
}
