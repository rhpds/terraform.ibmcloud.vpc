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
  default = "rhpds_vpc"
  description = "Name of your VPC"
}

variable "cidr_zone" {
  default = "172.22.0.0/21"
  description = "CIDR block to be used"
}

variable "subnet1_zone" {
  default = "172.22.16.0/23"
  description = "CIDR block to be used"
}

variable "subnet2_zone" {
  default = "172.22.18.0/23"
  description = "CIDR block to be used"
}
