variable "server_name" {
  description = "Enter a unique name for your PostgreSQL server"
}

variable "server_type" {
  default = "B_Gen5_2"
}

variable "username" {
  description = "Enter a username"
}

variable "password" {
  description = "Enter a password (Your password must contain characters from three of the following categories – English uppercase letters, English lowercase letters, numbers (0-9), and non-alphanumeric characters (!, $, #, %, etc.)"
}

variable "location" {
  default = "East US"
}

variable "rg" {
  description = "Enter a name of a resource group (a new resource will be created)"
}

variable "storage" {
  default = "5120"
}

variable "db_name" {
  description = "Enter a database name"
}
