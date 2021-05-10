variable "ibmcloud_region" {
  description = "Preferred IBM Cloud region to use for your infrastructure"
  default = "us-east"
}

variable "ibmcloud_zone" {
  description = "Preferred IBM Cloud zone in the region to use for your infrastructure"
  default = "2"
}

variable "resource_group" {
  default = "Default"
  description = "Define the resource group for the workload"
}

variable "vpc_name" {
  default = "rhpds"
  description = "Name of your VPC"
}

variable "subnet_name" {
  default = "rhpds"
  description = "Name of your Subnet"
}

variable "pg_name" {
  default = "rhpds"
  description = "Name of your Public Gateway"
}
