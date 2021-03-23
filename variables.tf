variable "app_name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}


variable "env" {
  type        = string
  description = "value of env variable"

  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "Valid values for environment should be: (dev, prod)."
  }
}



variable "account_tier" {
  type = map(any)
  default = {
    prod = "Premium"
    dev  = "Standard"
  }
}

variable "replicationtype" {
  type        = string
  description = "account replication type"

  validation {
    condition     = contains(["LRS", "GRS", "RA-GRS"], var.replicationtype)
    error_message = "Valid values for replication type are: (LRS, GRS, RA-GRS)."
  }
}