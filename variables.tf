variable "ibmcloud_region" {
  description = "Preferred IBM Cloud region to use for your infrastructure"
  default = "us-south"
}

variable "ibmcloud_zone" {
  description = "Preferred IBM Cloud zone in the region to use for your infrastructure"
  default = "10"
}

variable "resource_group" {
  default = "rhdp-rg"
  description = "Define the resource group for the workload"
}

variable "vpc_name" {
  default = "rhdp-vpc"
  description = "Name of your VPC"
}

variable "subnet_name" {
  default = "rhdp-subnet"
  description = "Name of your Subnet"
}

variable "pgw_name" {
  default = "rhdp-pgw"
  description = "Name of your Public Gateway"
}
